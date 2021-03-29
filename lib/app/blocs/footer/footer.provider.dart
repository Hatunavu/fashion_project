import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:suplo_project_8_12_2020/app/blocs/footer/footer.model.dart';

class FooterProvider {
  FooterModel footerModel;

  Future<FooterModel> getFooter(String url) async {
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map;
        footerModel = FooterModel.fromJson(responseData);
        return footerModel;
      } else {}
    } catch (exception) {}
  }
}