import 'package:imagine_apps_prueba/repository/api/imagine_apps.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';

class ImagineService {
  final ImagineApi _api = ImagineApi();
  // Stream<List<ImagineModel>> _imagines;
  // void loadImagines() {
  //   _imagines = _api.getImagines();
  // }

  Stream<List<ImagineModel>> getImagines() {
    // if()
    return _api.getImagines();
  }
}
