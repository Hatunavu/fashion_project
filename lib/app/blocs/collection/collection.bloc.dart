import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.responsity.dart';

class CollectionBloc {
  final reponsity = CollectionResponsity();
  CollectionModel collectionModel;
  final collectionFetcher = PublishSubject<CollectionModel>();
  Stream<CollectionModel> get allCollection => collectionFetcher.stream;

  fetchCollection(String url) async {
    CollectionModel tempCollection = await reponsity.getCollection(url);
    collectionFetcher.sink.add(tempCollection);
  }

  dispose() {
    collectionFetcher.close();
  }
}

final collectionBloc = CollectionBloc();
