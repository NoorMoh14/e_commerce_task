
import 'package:task/dto_models/home_model_dto.dart';

class ShortTermManager {
  static final ShortTermManager _shortTermManager =
      ShortTermManager._internal();

  String? language;
  String? dropDownValue;

  void clear() {
  }

  void setLanguage(String? language) {
    this.language = language;
  }

  String? getLanguage() {
    return language;
  }

  factory ShortTermManager() {
    return _shortTermManager;
  }

  ShortTermManager._internal();
}
