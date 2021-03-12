import 'dart:io';

import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

class UploadImageToAmplify
{
  Future<String> uploadProfileImage(File _image)
  async {
    final key = new DateTime.now().toString();
    Map<String, String> metadata = <String, String>{};
    metadata['name'] = 'filename';
    metadata['desc'] = 'A test file';
    S3UploadFileOptions options = S3UploadFileOptions(accessLevel: StorageAccessLevel.guest, metadata: metadata);
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
          key: key,
          local: _image,
          options: options
      );

      GetUrlResult re = await Amplify.Storage.getUrl(key: result.key);
      print(re.url);

      if(re.url.isEmpty){
        return null;
      }
      else{
        return re.url.toString();
      }
    } on StorageException catch (e) {
      print(e.message);
      return null;
    }
  }
}