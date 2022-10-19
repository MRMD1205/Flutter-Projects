import 'package:get/get.dart';
import 'package:movie_list/controllers/base_controller.dart';
import 'package:movie_list/models/movie_data_model.dart';
import 'package:movie_list/network/remote_services.dart';

class DashboardController extends BaseController {
  var moviesList = <MovieResults>[].obs;
  int currentPage = 1;
  int totalPages;
  var noLoader = false.obs;

  @override
  void onInit() {
    fetchMovies(currentPage);
    super.onInit();
  }

  void refreshMovies(int pageIndex) {
    fetchMovies(pageIndex);
  }

  void fetchMovies(int pageIndex) async {
    try {
      isLoading(true);
      var movies = await RemoteServices.fetchMovies(pageIndex);
      if (movies != null) {
        moviesList.addAll(movies.movieResultsList);
        totalPages = movies.totalPages;
        if (currentPage == totalPages) {
          noLoader.value = true;
        }
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    currentPage = 1;
    super.dispose();
  }
}
