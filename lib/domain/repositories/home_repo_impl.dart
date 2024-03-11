import 'package:injectable/injectable.dart';
import '../../dto_models/home_model_dto.dart';
import '../../network/webservice.dart';
import 'package:riverpod/riverpod.dart' as Response;

abstract class HomeRepo {
  Stream<Response.AsyncValue> fetchHome();
}

@Injectable()
class HomeRepoImpl extends HomeRepo {
  final Webservice _webservice;

  HomeRepoImpl(this._webservice);

  @override
  Stream<Response.AsyncValue> fetchHome() async* {
    final snapshots = _webservice.getWebservice();
    await for (final snapshot in snapshots) {
      yield snapshot.when(
          data: (data) => Response.AsyncData(
              data,
          ),
          error: (Object error, StackTrace stackTrace) =>
              Response.AsyncError(error, stackTrace),
          loading: () => const Response.AsyncLoading());
    }
  }
}