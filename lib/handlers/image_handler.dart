
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {

  /// Static function to pick single image
  static Future<XFile?> pick_image() async {
    final ImagePicker _picker = ImagePicker();
    
    XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    return _image;
  }


  /// Static function to pick single image
  static Future<List<XFile>?> pick_images() async {
    final ImagePicker _picker = ImagePicker();

    List<XFile>? _images = await _picker.pickMultiImage();
    return _images;
  }

}