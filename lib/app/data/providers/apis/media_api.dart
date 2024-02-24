import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:vsa_mobile/app/core/url/url.dart';
import 'package:http/http.dart' as http;

class MediaAPI {
  Future<String> UploadMedia(XFile file) async {
    final url = "$BASE_URL/upload";

    // Create a multipart request
    final request = http.MultipartRequest('POST', Uri.parse(url));

    // Add the file field
    final multipartFile = await http.MultipartFile.fromPath('file', file.path);
    request.files.add(multipartFile);

    try {
      // Send the request with progress updates
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final parsedJson = jsonDecode(responseBody);

        // Validate response structure and extract the URL
        if (parsedJson['url'] != null) {
          return parsedJson['url'];
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Error uploading file: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      // Handle network errors
      throw Exception('Network error: ${e.message}');
    } on HttpException catch (e) {
      // Handle other HTTP errors
      throw Exception('HTTP error: ${e.message}');
    } catch (e) {
      // Handle unexpected errors
      throw Exception('Error uploading file: ${e.toString()}');
    }
  }
}
