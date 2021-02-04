import 'dart:convert';
import 'dart:developer';

import 'collection.model.dart';
import 'package:http/http.dart' as http;

class CollectionProvider {
  CollectionModel collectionData;
  Products products;

  Future<CollectionModel> getModelFromApi(String url) async {
    // final url =
    //     'https://suplo-fashion.myharavan.com/collections/all?view=smb.json';
    final http.Client httpClient = http.Client();
    try {
      final response = await httpClient.get(url);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map;
        collectionData = CollectionModel.fromJson(responseData);
        return collectionData;
      } else {}
    } catch (exception) {}
  }
}
