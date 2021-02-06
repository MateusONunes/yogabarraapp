
import 'package:app_academias/domain/PessoaList.dart';
import 'package:app_academias/utils/GlobalObjects.dart';
import 'package:app_academias/providers/auth.dart';

class GestorService with ChangeNotifier {

  WSRestService ws = new WSRestService();

  Auth auth = new Auth();
  PessoaList pessoaList = new PessoaList();

  bool _init = false;
  bool isAuth = false;

  GestoreService() {
    init();
  }

  Future<void> init() async {
    if (_init) return;

    if (globalGestorservice == null) globalGestorservice = this;
    _init = true;
  }

  Future<void> tryAutoLogin() async {
    await init();
    return await auth.tryAutoLogin();
  }


}
