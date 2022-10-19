class MovieDataModel {
  int page;
  List<MovieResults> movieResultsList;
  int totalPages;
  int totalResults;

  MovieDataModel({this.page, this.movieResultsList, this.totalPages, this.totalResults});

  MovieDataModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movieResultsList = <MovieResults>[];
      json['results'].forEach((v) {
        movieResultsList.add(new MovieResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.movieResultsList != null) {
      data['results'] = this.movieResultsList.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class MovieResults {
  bool video;
  double voteAverage;
  int id;
  String overview;
  String releaseDate;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int voteCount;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  double popularity;
  String mediaType;
  String originalName;
  String name;
  String firstAirDate;

  MovieResults(
      {this.video,
        this.voteAverage,
        this.id,
        this.overview,
        this.releaseDate,
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.voteCount,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.title,
        this.popularity,
        this.mediaType,
        this.originalName,
        this.name,
        this.firstAirDate});

  MovieResults.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    voteAverage = json['vote_average'];
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    voteCount = json['vote_count'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    originalName = json['original_name'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['vote_count'] = this.voteCount;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    return data;
  }
}
