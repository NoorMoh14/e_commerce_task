
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/use_casess/fetch_home_use_case.dart';



class AddItemScreenViewModel extends ChangeNotifier {


  AddItemScreenViewModelListeners? _addItemScreenViewModelListeners;

  init(AddItemScreenViewModelListeners addItemScreenViewModelListeners) {
    _addItemScreenViewModelListeners = addItemScreenViewModelListeners;
  }

}

abstract class AddItemScreenViewModelListeners {
}


