import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';
import 'package:imagine_apps_prueba/services/imagine_service.dart';

class ImaginesCubit extends Cubit<bool> {
  ImaginesCubit() : super(false);
  final ImagineService _service = ImagineService();
  Stream<List<ImagineModel>>? _streamImages;

  Future<void> loadInitialData() async {
    try {
      emit(false);

      _streamImages = _service.getImagines();
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      emit(true);
    } catch (error) {
      emit(false);
    }
  }

  Stream<List<ImagineModel>>? getImagines() {
    return _streamImages;
  }
}
