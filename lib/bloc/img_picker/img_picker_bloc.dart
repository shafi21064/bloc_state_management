import 'package:bloc/bloc.dart';
import 'package:bloc_first/bloc/img_picker/img_picker_event.dart';
import 'package:bloc_first/bloc/img_picker/img_picker_state.dart';

import '../../utils/img_picker_utils.dart';

class ImgPickerBloc extends Bloc<ImgPickerEvent, ImgPickerState> {
  final ImgPickerUtils imgPickerUtils = ImgPickerUtils();

  ImgPickerBloc() : super(const ImgPickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryImgPick);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImgPickerState> emit) async {
    final file = await imgPickerUtils.cameraCapture();
    emit(state.copyWith(captureFromCamera: file));
  }
  void _galleryImgPick(GalleryPicker event, Emitter<ImgPickerState> emit) async {
    final file = await imgPickerUtils.galleryCapture();
    emit(state.copyWith(pickedFromGallery: file));
  }
}
