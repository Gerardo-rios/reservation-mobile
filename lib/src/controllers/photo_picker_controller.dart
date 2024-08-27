import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PhotoPickerController extends GetxController {
  static PhotoPickerController get find => Get.find();

  final Rx<String?> imagePath = Rx<String?>(null);

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final File file = File(image.path);
      final String newPath = '$path/${DateTime.now()}.png';
      await file.copy(newPath);
      imagePath.value = newPath;
    }
  }
}
