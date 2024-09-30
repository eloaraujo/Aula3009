import 'package:aula3009/datasource/shared.preference.datasource.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Rx<String> _email = Rx(""); //rx variavel reativa - pacote do get
  final Rx<String> _password = Rx(""); //
  final Rx<String?> message = Rx(null); //
  final Rx<bool> logged = Rx(false);
  late SharedPreferenceDatasource _datasource;

  //externar o email e password que ta acessivel so pra nossa classe "_"
  //estão como privada
  String get email => _email.value;

  String get password => _password.value; //

  initController() async{
    _datasource.initPreference();
  }


  save(String email, String password) {
    bool isValid = true;

    if (email.isEmpty) {
      message.value = "Informe o email";
      isValid = false;
    }

    if (email.isEmpty) {
      message.value = "Informe o password";
      isValid = false;
    }

    if (isValid) {
      //salvar no preference
      _datasource.save("email", email);
      _datasource.save("password", password);

      //se deu certo, se conseguiu salvar:
      logged.value = true;
    }
  }
}
