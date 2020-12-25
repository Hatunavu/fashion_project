import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';

class NewProvider {
  NewModel newModel1;
  Future<NewModel> getNewFromApi() async {
    final url = 'https://suplo-fashion.myharavan.com/blogs/news?view=smb.json';
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final reponseData = json.decode(response.body) as Map;
        newModel1 = NewModel.fromJson(reponseData);
        return newModel1;
      }
    } catch (exception) {}
  }
}
