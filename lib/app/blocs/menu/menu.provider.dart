import 'dart:developer';

import 'package:suplo_project_8_12_2020/app/blocs/menu/menu.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuProvider {
  MenuModel menuModel;
  Future<MenuModel> getMenu(String url) async {
    debugger();
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map;
        menuModel = MenuModel.fromJson(responseData);
        return menuModel;
      } else {}
    } catch (exception) {}
  }
}
