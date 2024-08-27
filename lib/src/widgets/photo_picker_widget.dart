import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sport_spot/src/controllers/photo_picker_controller.dart';
import 'package:sport_spot/src/constants/text_strings.dart';

class PhotoPickerWidget extends StatelessWidget {
  const PhotoPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoPickerController controller = Get.put(PhotoPickerController());
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => controller.pickImage(ImageSource.camera),
              child: const Text(tPhotoPicker),
            ),
            ElevatedButton(
              onPressed: () => controller.pickImage(ImageSource.gallery),
              child: const Text(tImagePicker),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(() {
          if (controller.imagePath.value != null) {
            return Image.file(
              File(controller.imagePath.value!),
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            );
          } else {
            return const Text(tNoImageSelected);
          }
        }),
      ],
    );
  }
}
