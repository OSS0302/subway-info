import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'subway_station_info.freezed.dart';

part 'subway_station_info.g.dart';

@freezed
class SubwayStationInfo with _$SubwayStationInfo {
  const factory SubwayStationInfo({
    @JsonKey(name: 'statnNm') required String station,
    @JsonKey(name: 'updnLine') required String direction,
    @JsonKey(name: 'trainLineNm') required String trainline,
    @JsonKey(name: 'arvlMsg2') required String stationInfo,
  }) = _SubwayStationInfo;

  factory SubwayStationInfo.fromJson(Map<String, Object?> json) => _$SubwayStationInfoFromJson(json);
}