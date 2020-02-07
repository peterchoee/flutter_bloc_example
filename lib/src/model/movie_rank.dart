class MovieRank {

  BoxOfficeResult boxOfficeResult;

  MovieRank({
    this.boxOfficeResult
  });

  factory MovieRank.fromJson(Map<String, dynamic> json) {
    return MovieRank(
        boxOfficeResult: json['boxOfficeResult'] != null
            ? new BoxOfficeResult.fromJson(json['boxOfficeResult'])
            : null
    );
  }
}

class BoxOfficeResult {
  String boxofficeType;
  String showRange;
  List<DailyBoxOfficeList> dailyBoxOfficeList;

  BoxOfficeResult({
    this.boxofficeType,
    this.showRange,
    this.dailyBoxOfficeList
  });

  factory BoxOfficeResult.fromJson(Map<String, dynamic> json) {

    var jsonDailyList = json['dailyBoxOfficeList'] as List;
    List<DailyBoxOfficeList> parsedDailyList = jsonDailyList.map((i) => DailyBoxOfficeList.fromJson(i)).toList();

    return BoxOfficeResult(
        boxofficeType: json['boxofficeType'],
        showRange: json['showRange'],
        dailyBoxOfficeList: parsedDailyList
    );
  }
}

class DailyBoxOfficeList {
  String rnum;
  String rank;
  String rankInten;
  String rankOldAndNew;
  String movieCd;
  String movieNm;
  String openDt;
  String salesAmt;
  String salesShare;
  String salesInten;
  String salesChange;
  String salesAcc;
  String audiCnt;
  String audiInten;
  String audiChange;
  String audiAcc;
  String scrnCnt;
  String showCnt;

  DailyBoxOfficeList({
    this.rnum,
    this.rank,
    this.rankInten,
    this.rankOldAndNew,
    this.movieCd,
    this.movieNm,
    this.openDt,
    this.salesAmt,
    this.salesShare,
    this.salesInten,
    this.salesChange,
    this.salesAcc,
    this.audiCnt,
    this.audiInten,
    this.audiChange,
    this.audiAcc,
    this.scrnCnt,
    this.showCnt
  });

  factory DailyBoxOfficeList.fromJson(Map<String, dynamic> json) {
    return DailyBoxOfficeList(
      rnum: json['rnum'],
      rank: json['rank'],
      rankInten: json['rankInten'],
      rankOldAndNew: json['rankOldAndNew'],
      movieCd: json['movieCd'],
      movieNm: json['movieNm'],
      openDt: json['openDt'],
      salesAmt: json['salesAmt'],
      salesShare: json['salesShare'],
      salesInten: json['salesInten'],
      salesChange: json['salesChange'],
      salesAcc: json['salesAcc'],
      audiCnt: json['audiCnt'],
      audiInten: json['audiInten'],
      audiChange: json['audiChange'],
      audiAcc: json['audiAcc'],
      scrnCnt: json['scrnCnt'],
      showCnt: json['showCnt']
    );
  }
}