

import 'package:subwayinfo_app/data/subway_api.dart';
import 'package:subwayinfo_app/model/subway_station_info.dart';
import 'package:subwayinfo_app/result/result.dart';

import 'subway_station_repository.dart';

class SubwayStationRepositoryImpl implements SubWayStationRepository {
  final SubwayApi _api;

  SubwayStationRepositoryImpl(this._api);

  @override
  Future<Result<List<SubwayStationInfo>>> getSubwayStationInfo(String stationName) async {
    try {
      final  response = await _api.getSubwayInfoList(stationName);
      final result = response.map((e) => SubwayStationInfo.fromJson(e)).toList();
      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('데이터값이 없습니다.${e.toString()}'));
    }
  }
}
