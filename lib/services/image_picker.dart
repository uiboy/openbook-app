import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static const Map IMAGE_RATIOS = {
    OBImageType.avatar: {'x': 1.0, 'y': 1.0},
    OBImageType.cover: {'x': 16.0, 'y': 9.0}
  };

  Future<File> pickImage({OBImageType imageType, ImageSource source}) async {
    var image = await ImagePicker.pickImage(source: source);

    if (image == null) {
      return null;
    }

    double ratioX = IMAGE_RATIOS[imageType]['x'];
    double ratioY = IMAGE_RATIOS[imageType]['y'];

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: ratioX,
      ratioY: ratioY,
    );

    return croppedFile;
  }
}

enum OBImageType { avatar, cover }
