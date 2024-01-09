import 'package:get_it/get_it.dart';
import 'package:subwayinfo_app/data/repository/subway_station_repository.dart';
import 'package:subwayinfo_app/data/repository/subway_station_repository_Impl.dart';
import 'package:subwayinfo_app/data/subway_api.dart';
import 'package:subwayinfo_app/ui/main_veiw_model.dart';
final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<SubwayApi>(SubwayApi());
  getIt.registerSingleton<SubWayStationRepository>(
      SubwayStationRepositoryImpl(getIt<SubwayApi>()));

  getIt.registerFactory<MainViewModel>(() =>
      MainViewModel(stationRepository: getIt<SubWayStationRepository>()));
}
