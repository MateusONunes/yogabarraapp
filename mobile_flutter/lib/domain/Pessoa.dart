import 'package:app_academias/utils/GlobalObjects.dart';

class Pessoa{
  int codigopess;
  String nomepess;
  String nascimentopess;
  String enderecopess;
  String cpfpess;
  String rgpess;
  String cidadepess;
  String fonewpess;
  String fone2pess;
  String fone3pess;
  String emailpess;
  String observacoespess;

  Pessoa({
      this.codigopess,
      this.nomepess,
      this.nascimentopess,
      this.enderecopess,
      this.cpfpess,
      this.rgpess,
      this.cidadepess,
      this.fonewpess,
      this.fone2pess,
      this.fone3pess,
      this.emailpess,
      this.observacoespess});

  factory Pessoa.fromJSON(dynamic objJSON) {
    return Pessoa(
      codigopess: objJSON['codigopess'],
      nomepess: objJSON['nomepess'],
      nascimentopess: objJSON['nascimentopess'],
      enderecopess: objJSON['enderecopess'],
      cpfpess: objJSON['cpfpess'],
      rgpess: objJSON['rgpess'],
      cidadepess: objJSON['cidadepess'],
      fonewpess: objJSON['fonewpess'],
      fone2pess: objJSON['fone2pess'],
      fone3pess: objJSON['fone3pess'],
      emailpess: objJSON['emailpess'],
      observacoespess: objJSON['observacoespess']);
  }
}