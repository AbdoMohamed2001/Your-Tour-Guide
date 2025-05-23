import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
 XFile? _file = await _imagePicker.pickImage(source: source);
 if(_file != null){
   return await _file.readAsBytes();
 }
  print('no image selected');
}


bool isArabic(){
  return Intl.getCurrentLocale() == 'ar';
}