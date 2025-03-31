import 'package:flutter/widgets.dart';

String sanityImageUrl(String ref, {int? width, int? height}) {
  final parts = ref.split(
      '-'); // Expected format: ["image", "{id}", "{width}x{height}", "format"]
  if (parts.length < 4) return "";

  const projectId = String.fromEnvironment('PROJECT_ID');
  const dataset = String.fromEnvironment('DATA_SET');
  final imageId = parts[1];
  final defaultSize = parts[2];
  final format = parts.last;
  const baseUrl = 'https://cdn.sanity.io/images/$projectId/$dataset';

  // Use provided dimensions or default to reference dimensions
  final size =
      (width != null && height != null) ? '${width}x$height' : defaultSize;

  return '$baseUrl/$imageId-$size.$format';
}


extension ScreenSizeExtension on BuildContext {
  bool get isDesktop => MediaQuery.of(this).size.width > 600;
  double get screenWidth  => MediaQuery.of(this).size.width;
  double get screenHeight  => MediaQuery.of(this).size.height;
}
