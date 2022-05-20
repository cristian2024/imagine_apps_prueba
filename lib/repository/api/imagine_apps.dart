import 'dart:convert';

import 'package:imagine_apps_prueba/repository/model/imagine_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ImagineApi {
  Stream<List<ImagineModel>> getImagines() async* {
    Uri url = Uri.https('rest.imagineapps.co', '/cocoa-contracts');
    http.Response response = await http.get(url);
    List<ImagineModel> imagines = [];
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      for (String json in jsonResponse.keys) {
        try {
          ImagineModel imagine = ImagineModel.fromMap(jsonResponse[json]);
          imagines.add(imagine);
          yield imagines;
        } catch (e) {}

        await Future.delayed(
          const Duration(seconds: 5),
        );
      }
    }
  }
}
