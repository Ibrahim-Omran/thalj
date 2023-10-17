import 'package:image_picker/image_picker.dart';

Future pickImageFromGallery() async {
  final returnedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (returnedImage != null) {
    return returnedImage.path;
  } else {
    return null;
  }
}
