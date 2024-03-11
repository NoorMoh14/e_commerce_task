import 'package:injectable/injectable.dart';

import 'package:riverpod/riverpod.dart' as Response;
import '../repositories/home_repo_impl.dart';



abstract class FetchHomeUseCase {
  Stream<Response.AsyncValue> fetchHome();
}

@injectable
class FetchHomeUseCaseImpl extends FetchHomeUseCase {
  final HomeRepoImpl _homeImpl;

  FetchHomeUseCaseImpl(this._homeImpl);

  @override
  Stream<Response.AsyncValue> fetchHome() async*{
    yield* _homeImpl.fetchHome();

  }

}
