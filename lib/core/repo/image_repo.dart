import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mafqood/core/repo/repo.dart';
import 'package:path_provider/path_provider.dart';

class ImageRepo extends Repository {
  Future<String> uploadImageToFirebase(XFile image) async {
    File compressedFile = await compressFile(File(image.path));
    String fileName = compressedFile.path.split('/').last;
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(compressedFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    return await taskSnapshot.ref.getDownloadURL();
  }

  Future<File> compressFile(File file) async {
    // Get the file path
    final filePath = file.absolute.path;

    // Create a new file in the temporary directory with a unique name
    final compressedFile = await File('${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.jpg').create();

    // Get the original file as bytes
    final List<int> bytes = await file.readAsBytes();

    // Convert the bytes to a Uint8List
    final Uint8List uint8list = Uint8List.fromList(bytes);

    // Compress the image
    final result = await FlutterImageCompress.compressWithList(uint8list, quality: 50);

    // Write the compressed image to the new file
    await compressedFile.writeAsBytes(result);

    return compressedFile;
  }
}
