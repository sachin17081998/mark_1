import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// SanityService class to handle fetching data from Sanity API.
///
/// Implements the Singleton pattern and ensures sensitive data like the API token
/// is securely passed and stored.
class SanityService {
  // Private constructor for Singleton pattern
  SanityService._();

  // Static instance for the Singleton
  static final SanityService _instance = SanityService._();

  // Public getter to access the Singleton instance
  static SanityService get instance => _instance;

  late final String _projectId;
  late final String _dataset;
  late final String _apiVersion;
  String? _token;

  /// Initialize the SanityService with project details and optional token.
  ///
  /// This method must be called before using any fetch operations.
  void initialize({
    required String projectId,
    required String dataset,
    required String apiVersion,
    String? token,
  }) {
    _projectId = projectId;
    _dataset = dataset;
    _apiVersion = apiVersion;
    _token = token;
  }

  /// Fetch a single document from Sanity.
  ///
  /// [query] - GROQ query string to fetch the document.
  /// [fromJson] - A function that converts JSON to a Dart object.
  Future<T?> fetchSingleDocument<T>({
    required String query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    if (_projectId.isEmpty || _apiVersion.isEmpty || _dataset.isEmpty) {
      throw Exception('SanityService is not initialized.');
    }

    // final encodedQuery = Uri.encodeComponent(query);
    final url =
        'https://$_projectId.api.sanity.io/$_apiVersion/data/query/$_dataset?query=$query';
    // final url =
    //     "https://racoce49.api.sanity.io/v2022-03-07/data/query/mark_1?query=*%5B_type+%3D%3D+%22about%22%5D";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['result'] as List;

        // Return the first document if available, otherwise null
        return results.isNotEmpty
            ? fromJson(results.first as Map<String, dynamic>)
            : null;
      } else {
        throw Exception(
            'Failed to fetch data. HTTP Status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching single document: $e');
      throw Exception('Failed to fetch single document from Sanity.');
    }
  }

  /// Fetch a list of documents from Sanity.
  ///
  /// [query] - GROQ query string to fetch the documents.
  /// [fromJson] - A function that converts JSON to a Dart object.
  Future<List<T>> fetchDocuments<T>({
    required String query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    if (_projectId.isEmpty || _apiVersion.isEmpty || _dataset.isEmpty) {
      throw Exception('SanityService is not initialized.');
    }

    final encodedQuery = Uri.encodeComponent(query);
    final url =
        'https://$_projectId.api.sanity.io/$_apiVersion/data/query/$_dataset?query=$encodedQuery';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          if (_token != null) 'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['result'] as List;

        // Map each document in the list to the generic type T
        return results
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch data. HTTP Status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching documents: $e');
      throw Exception('Failed to fetch documents from Sanity.');
    }
  }
}
