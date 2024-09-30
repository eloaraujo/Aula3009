import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDatasource{
  late SharedPreferences _preference;

  initPreference() async {
    //classe assincrona que roda na thread difrente, Não bloqueia a acao do usaurio
    _preference = await SharedPreferences.getInstance();
  }

  //precisa ter chaves, tipo chave /valor
  save(String key, String value){
    _preference.setString(key, value);
  }

}