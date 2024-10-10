import 'dart:convert';

import 'package:get/get.dart';

void handleException(dynamic e) {
  String errorMessage;

  try {
    final String errorString = e.toString().replaceFirst('Exception: ', '');

    final Map<String, dynamic> errorMap = jsonDecode(errorString);

    errorMessage =
        errorMap['message'] ?? 'Something went wrong. Please try again later.';
  } on Exception catch (e) {
    print(e);
    errorMessage = 'Something went wrong. Please try again later.';
  }

  Get.snackbar('Error', errorMessage);
}
