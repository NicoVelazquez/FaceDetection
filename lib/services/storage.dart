import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  Future<String> startUpload(File file, String userId) async {
    String filePath = 'images/$userId.jpg';
    StorageReference storageReference = FirebaseStorage.instance.ref().child(filePath);

    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }
}
