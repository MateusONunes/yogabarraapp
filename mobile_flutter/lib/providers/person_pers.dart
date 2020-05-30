import 'package:flutter/foundation.dart';

class Person_pers with ChangeNotifier {
  final String code_pers; 
  final String name_pers;
  final String birth_pers;
  final String address_pers;
  final String city_pers;
  final String zipcode_pers;
  final String cpf_pers;
  final String rg_pers;
  final String phonewhats_pers;
  final String email_pers;
  final String fisicajuridica_pers;
  final String comments_per;
  final String login_pers;

  Person_pers({
    this.code_pers,
    @required this.name_pers,
    @required this.birth_pers,
    @required this.address_pers,
    @required this.city_pers,
    @required this.zipcode_pers,
    @required this.cpf_pers,
    @required this.rg_pers,
    @required this.phonewhats_pers,
    @required this.email_pers,
    @required this.fisicajuridica_pers,
    @required this.comments_per,
    @required this.login_pers,
  });
}
