import 'package:equatable/equatable.dart';

abstract class ImgPickerEvent extends Equatable{
  const ImgPickerEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CameraCapture extends ImgPickerEvent{}
class GalleryPicker extends ImgPickerEvent{}