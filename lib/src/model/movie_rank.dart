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
/*
boxofficeType	  문자열	박스오피스 종류를 출력합니다.
showRange	      문자열	박스오피스 조회 일자를 출력합니다.
rnum	          문자열	순번을 출력합니다.
rank	          문자열	해당일자의 박스오피스 순위를 출력합니다.
rankInten	      문자열	전일대비 순위의 증감분을 출력합니다.
rankOldAndNew	  문자열	랭킹에 신규진입여부를 출력합니다. “OLD” : 기존 , “NEW” : 신규
movieCd	        문자열	영화의 대표코드를 출력합니다.
movieNm	        문자열	영화명(국문)을 출력합니다.
openDt	        문자열	영화의 개봉일을 출력합니다.
salesAmt	      문자열	해당일의 매출액을 출력합니다.
salesShare	    문자열	해당일자 상영작의 매출총액 대비 해당 영화의 매출비율을 출력합니다.
salesInten	    문자열	전일 대비 매출액 증감분을 출력합니다.
salesChange	    문자열	전일 대비 매출액 증감 비율을 출력합니다.
salesAcc	      문자열	누적매출액을 출력합니다.
audiCnt	        문자열	해당일의 관객수를 출력합니다.
audiInten	      문자열	전일 대비 관객수 증감분을 출력합니다.
audiChange	    문자열	전일 대비 관객수 증감 비율을 출력합니다.
audiAcc	        문자열	누적관객수를 출력합니다.
scrnCnt	        문자열	해당일자에 상영한 스크린수를 출력합니다.
showCnt	        문자열	해당일자에 상영된 횟수를 출력합니다.
*/