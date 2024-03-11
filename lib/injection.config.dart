// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/repositories/home_repo_impl.dart' as _i11;
import 'domain/use_casess/fetch_home_use_case.dart' as _i4;
import 'feature/home_screen/home_screen_view_model.dart' as _i3;
import 'inject_models/app_module.dart' as _i14;
import 'network/webservice.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.HomeScreenViewModel>(
      () => _i3.HomeScreenViewModel(get<_i4.FetchHomeUseCase>()));
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i9.Dio>(
      () => appModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i10.Webservice>(() => _i10.Webservice(get<_i9.Dio>()));
  gh.factory<_i11.HomeRepoImpl>(
      () => _i11.HomeRepoImpl(get<_i10.Webservice>()));
  gh.factory<_i4.FetchHomeUseCase>(
      () => _i4.FetchHomeUseCaseImpl(get<_i11.HomeRepoImpl>()));
  return get;
}

class _$AppModule extends _i14.AppModule {}
