import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImgPickerState extends Equatable {
  final XFile? captureFromCamera, pickedFromGallery;

  const ImgPickerState({this.captureFromCamera, this.pickedFromGallery});

  ImgPickerState copyWith(
      {XFile? captureFromCamera, XFile? pickedFromGallery}) {
    return ImgPickerState(
        captureFromCamera: captureFromCamera ?? this.captureFromCamera,
        pickedFromGallery: pickedFromGallery ?? this.pickedFromGallery);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [captureFromCamera, pickedFromGallery];
}
