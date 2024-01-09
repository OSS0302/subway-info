import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subwayinfo_app/model/subway_station_info.dart';
class SubwayApi {
  Future<List<dynamic>> getSubwayInfoList(String stationName) async {
    final String _baseUrl = 'http://swopenapi.seoul.go.kr/api/subway';
    final response = await http.get(Uri.parse( '$_baseUrl/sample/json/realtimeStationArrival/0/5/$stationName'));
    final jsonList = jsonDecode( response.body)['realtimeArrivalList'] as List<dynamic>;
    return jsonList.map((e) => SubwayStationInfo.fromJson(e)).toList();

  }
}