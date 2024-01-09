import 'dart:async';

import 'package:flutter/material.dart';

import 'package:subwayinfo_app/data/repository/subway_station_repository.dart';
import 'package:subwayinfo_app/model/subway_station_info.dart';
import 'package:subwayinfo_app/result/result.dart';
import 'package:subwayinfo_app/ui/main_state.dart';

import 'main_event.dart';

class MainViewModel extends ChangeNotifier{
  final SubWayStationRepository _stationRepository;

  MainState _state = const MainState();

  MainState get state => _state;


  MainViewModel({
    required SubWayStationRepository stationRepository,
  })  : _stationRepository = stationRepository;


  Future<void>getSubwayStationInfoList(String stationName) async {

    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _stationRepository.getSubwayStationInfo(stationName);

    switch(result) {
      case Success<List<SubwayStationInfo>>():
        _state = state.copyWith(
          subwayStationInfoList: result.data,
          isLoading: false,
        );
        notifyListeners();
      case Error<List<SubwayStationInfo>>():
    }
  }

}
class Debounce {
  final Duration duration;
  Timer? _timer;

  Debounce(this.duration);

  void onEvent(void Function() callback) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(duration, () => callback());
  }
}