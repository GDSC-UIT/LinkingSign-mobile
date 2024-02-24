import 'dart:io';

import 'package:camera/camera.dart';
import 'package:vsa_mobile/app/data/providers/apis/media_api.dart';

class MediaRepository {
  var media_api = MediaAPI();
  Future<String> uploadVideo(XFile video_file) async {
    String video_url = await media_api.UploadMedia(video_file);
    return video_url;
  }
}
