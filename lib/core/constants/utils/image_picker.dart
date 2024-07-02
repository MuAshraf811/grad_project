import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  static ImagePicker? _imagePicker;
  static XFile? image;
  ImagePickerHandler._();

  // intialise
  static ImagePicker init() {
    if (_imagePicker == null) {
      _imagePicker = ImagePicker();
      return _imagePicker!;
    } else {
      return _imagePicker!;
    }
  }

  static pickImage(ImageSource source) async {
    image = await _imagePicker!.pickImage(
      source: source,
    );
  }
}
