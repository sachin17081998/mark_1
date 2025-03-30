import 'dart:convert';

import 'package:mark_1/api/models/about.dart';
import 'package:sanity_service/sanity_client.dart';

class Api {
  static Future<void> fetchAbout() async {
    const query = '*[_type == "about"]';

    try {
      // final data = await SanityService.instance.fetchSingleDocument<About>(
      //   query: query,
      //   fromJson: (json) => About.fromJson(json),
      // );
      
      await Future.delayed(Duration(seconds: 2));
      final data=About.fromJson(jsonDecode(mockAbout));
      if (data != null) {
        print('Title: ${data.firstName}, Body: ${data.lastName}');
      } else {
        print('No document found.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

const mockAbout='''{
  "_createdAt": "2024-12-24T16:37:37Z",
  "_id": "3ae60234-ceaa-4b2b-875b-8e839e7fd4f2",
  "_rev": "NFtv7L0LfmRuNXtL4gvYMK",
  "_type": "about",
  "_updatedAt": "2025-03-30T06:36:43Z",
  "age": 26,
  "contact": [
    {
      "_key": "58cf6ec4b402",
      "contactDetails": "sachinsingh1781998@gmail.com",
      "contactIcon": {
        "_type": "image",
        "asset": {
          "_ref": "image-0c0dc6393223d0f65b4ced2ff40f5745acb7da13-225x225-jpg",
          "_type": "reference"
        }
      },
      "contactName": "Email",
      "hasLink": false
    },
    {
      "_key": "d4618e93ca15",
      "contactIcon": {
        "_type": "image",
        "asset": {
          "_ref": "image-9c08157fd7145832615777f308cd00fd505394fd-1668x2420-png",
          "_type": "reference"
        }
      },
      "contactLink": "https://www.linkedin.com/in/sachin-kumar-singh-4190251a2/",
      "contactName": "Linkdn",
      "hasLink": true
    }
  ],
  "coverImage": {
    "_type": "image",
    "asset": {
      "_ref": "image-14bcd9883d36d13138a5b8a615d4efc87d3a2664-2261x2420-png",
      "_type": "reference"
    }
  },
  "dateOfBirth": "1998-08-17",
  "detailDescription": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  "firstName": "Sachin",
  "gender": "male",
  "lastName": "Singh",
  "nationality": "Indian",
  "secondName": "Kumar",
  "shortDescription": "I am a Frontend Developer who works in TATA Digital"
}''';