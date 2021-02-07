import 'package:app_academias/utils/GlobalObjects.dart';

class Pessoa {
  int codigopess;
  String nomepess;
  String apelidopess;
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

  Pessoa(
      {this.codigopess,
      this.nomepess,
      this.apelidopess,
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
  
  copyFrom(Pessoa pessoaCopiar){
    this.codigopess = pessoaCopiar.codigopess;
    this.nomepess = pessoaCopiar.nomepess;
    this.apelidopess = pessoaCopiar.apelidopess;
    this.nascimentopess = pessoaCopiar.nascimentopess;
    this.enderecopess = pessoaCopiar.enderecopess;
    this.cpfpess = pessoaCopiar.cpfpess;
    this.rgpess = pessoaCopiar.rgpess;
    this.cidadepess = pessoaCopiar.cidadepess;
    this.fonewpess = pessoaCopiar.fonewpess;
    this.fone2pess = pessoaCopiar.fone2pess;
    this.fone3pess = pessoaCopiar.fone3pess;
    this.emailpess = pessoaCopiar.emailpess;
    this.observacoespess = pessoaCopiar.observacoespess;
  }

  factory Pessoa.fromJSON(dynamic objJSON) {
    return Pessoa(
        codigopess: objJSON['codigopess'],
        nomepess: objJSON['nomepess'],
        apelidopess: objJSON['apelidopess'],
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

  toJSON() {
    return {
      "codigopess": this.codigopess,
      "nomepess": this.nomepess,
      "apelidopess": this.apelidopess,
      "nascimentopess": this.nascimentopess,
      "enderecopess": this.enderecopess,
      "cpfpess": this.cpfpess,
      "rgpess": this.rgpess,
      "cidadepess": this.cidadepess,
      "fonewpess": this.fonewpess,
      "fone2pess": this.fone2pess,
      "fone3pess": this.fone3pess,
      "emailpess": this.emailpess,
      "observacoespess": this.observacoespess
    };
  }
}
