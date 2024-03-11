
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/use_casess/fetch_home_use_case.dart';
import 'home_reading_writing_model.dart';


@Injectable()
class HomeScreenViewModel extends ChangeNotifier {

  List<Map<String, dynamic>> products = [];
  late int itemCount = 0;
  bool? isFinish = false;

  HomeScreenViewModelListeners? _homeScreenViewModelListeners;
  HomeReadingWritingModel? readingWritingModel;
  final FetchHomeUseCase _fetchHomeUseCase;

  HomeScreenViewModel(this._fetchHomeUseCase,);

  init(HomeScreenViewModelListeners homeScreenViewModelListeners) {
    _homeScreenViewModelListeners = homeScreenViewModelListeners;
    readingWritingModel = HomeReadingWritingModel();
    fetchHome();
  }



  fetchHome() {
    _fetchHomeUseCase
        .fetchHome()
        .listen((value) => value.when(
      loading: () {
        print("Loading");
      },
      error: (error, stack) {
        print("the error that occurred is: $error");
      },
      data: (data) {
          products.add(data);
      },
    )).onDone(() {
      itemCount = products.length;
      isFinish = true;
      notifyListeners();
    });
  }


}

abstract class HomeScreenViewModelListeners {

}


