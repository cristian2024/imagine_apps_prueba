import 'package:imagine_apps_prueba/repository/api/imagine_apps.dart';
import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';

class ImagineService {
  ImagineApi _api = ImagineApi();
  Stream<List<ImagineModel>> imagines() {
    return _api.getImagines();
  }
}
