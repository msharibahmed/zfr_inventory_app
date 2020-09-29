import 'package:zfr_inventory_app/main_imports.dart';

class Teddy with ChangeNotifier {
  String _anim='idle';

  String get anim {
    return _anim;
  }

  void changeMode(String anim) {
    _anim = anim;

    notifyListeners();
  }
}
