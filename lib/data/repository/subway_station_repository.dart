

import 'package:subwayinfo_app/model/subway_station_info.dart';
import 'package:subwayinfo_app/result/result.dart';

abstract interface class SubWayStationRepository {
  Future<Result<List<SubwayStationInfo>>> getSubwayStationInfo(String stationName);
}