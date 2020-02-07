import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/src/model/movie_rank.dart';
import 'package:flutter_bloc_example/src/util/FormatDateUtil.dart';

class MovieApiProvider {

  final _apiKey = '7d27c7864ebc5403d8f7040b059e803b';
  final _baseUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";

  Future<List<DailyBoxOfficeList>> fetchMovieRank() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(
        _baseUrl,
        queryParameters: {"key": _apiKey, "targetDt": FormatDateUtil().targetDate()});
    print(response.toString());
    return MovieRank.fromJson(json.decode(response.toString())).boxOfficeResult.dailyBoxOfficeList;
  }
}