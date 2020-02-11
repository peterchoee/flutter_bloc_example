class MovieFavor {
  final int id;
  final String rank;
  final String rankInten;
  final String movieNm;
  final String openDt;
  final String salesAcc;
  final String audiAcc;
  final String createAt;

  MovieFavor({
    this.id, this.rank, this.rankInten, this.movieNm, this.openDt,
    this.salesAcc, this.audiAcc, this.createAt
  });

  factory MovieFavor.fromDatabaseJson(Map<String, dynamic> data) => MovieFavor(
    id: data['id'],
    rank: data['rank'],
    rankInten: data['rankInten'],
    movieNm: data['movieNm'],
    openDt: data['openDt'],
    salesAcc: data['salesAcc'],
    audiAcc: data['audiAcc'],
    createAt: data['createAt']
  );

  Map<String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "rank": this.rank,
    "rankInten": this.rankInten,
    "movieNm": this.movieNm,
    "openDt": this.openDt,
    "salesAcc": this.salesAcc,
    "audiAcc": this.audiAcc,
    "createAt": this.createAt,
  };

  @override
  String toString() {
    return 'Movie{rank: $rank, rankInten: $rankInten, '
        'movieNm: $movieNm, openDt: $openDt, salesAcc: $salesAcc, '
        'audiAcc: $audiAcc, createAt: $createAt}';
  }
}
