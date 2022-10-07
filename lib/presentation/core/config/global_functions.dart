import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moments_app/presentation/core/config/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

class GlobalUiFunctions {
  static Widget loading({
    double size = 35,
    Color color = AppColors.mainColor,
  }) {
    return SpinKitThreeBounce(
      size: size,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  static Widget get emptyWidget => Text("empty");

  Future<File?> getImageWithCrop({
    required BuildContext context,
    required CropAspectRatio aspectRatio,
  }) async {
    final ImagePicker picker = ImagePicker();
    const status = Permission.manageExternalStorage;
    await Permission.manageExternalStorage.request();
    if ((await status.isDenied)) {
      await Permission.manageExternalStorage.request();
    }
    File? image;
    final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    log(xFile?.name ?? "");
    if (xFile != null) {
      final imageCropper = await ImageCropper().cropImage(
          sourcePath: xFile.path,
          aspectRatio: aspectRatio,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Theme.of(context).primaryColor,
              toolbarWidgetColor: Theme.of(context).colorScheme.secondary,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              minimumAspectRatio: 1.0,
              aspectRatioLockEnabled: true,
            ),
          ]);
      if (imageCropper != null) {
        image = File(imageCropper.path);
      }
    }
    return image;
  }
}
