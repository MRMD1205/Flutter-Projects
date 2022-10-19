import 'package:bloc_movie_demo/src/models/item_model.dart';
import 'package:bloc_movie_demo/src/models/vegetable_model.dart';
import 'package:bloc_movie_demo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();
  final _vegetableFetcher = PublishSubject<ResponseDataModel>();

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;
  Stream<ResponseDataModel> get allVegetablesData => _vegetableFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  fetchAllVegetablesDetails() async {
    ResponseDataModel dataModel = await _repository.fetchAllVegetables();
    _vegetableFetcher.sink.add(dataModel);
  }

  dispose() {
    _moviesFetcher.close();
    _vegetableFetcher.close();
  }
}

final bloc = MoviesBloc();
