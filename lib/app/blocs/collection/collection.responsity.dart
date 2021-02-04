import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.provider.dart';

class CollectionResponsity {
  CollectionProvider collectionProvider = CollectionProvider();
  Future<CollectionModel> getCollection(String url) =>
      collectionProvider.getModelFromApi(url);
}
