import 'package:app_academias/utils/GlobalObjects.dart';

class PessoaList {
  List<Pessoa> items = [];

  int get itemsCount => items.length;

  Future<void> carregarPessoas() async {
    items = await globalGestorservice.ws.getPessoas();
    print('x');
    return Future.value();
  }

  int pessoaBycodigopessGetIndex(int codigopess) {
    for (var i = 0; i < items.length; ++i) {
      if (items[i].codigopess == codigopess)
        return i;
    }

    return -1;
  }

  Pessoa pessoaBycodigopess(int codigopess) => items[pessoaBycodigopessGetIndex(codigopess)];

  Future<void> updateInsertPessoa(Pessoa pessoaUpdate) async {
    Pessoa pessoaWS = await globalGestorservice.ws.postPessoa(pessoaUpdate);

    int indexPessoa = pessoaBycodigopessGetIndex(pessoaWS.codigopess);

    if (indexPessoa == -1) {
      items.add(pessoaWS);
    } else {
      items[indexPessoa].copyFrom(pessoaWS);
    }
  }

  Future<void> deletePessoa(int codigopess) async {
    int index = pessoaBycodigopessGetIndex(codigopess);

    if (index != -1){
      await globalGestorservice.ws.deletePessoa(codigopess);
      items.removeRange(index, index + 1);
      print('x');

    }else{
      throw 'Não foi possível deletar o aluno de código: ' + codigopess.toString();
    }


    // final index = _items.indexWhere((person) => person.id== id);
    // if (index >= 0) {
    //   final person_pers = _items[index];
    //
    //   Firestore db = Firestore.instance;
    //
    //   db.collection('person_pers').document(id.toString()).delete()
    //     .then((value) {
    //       _items.remove(person_pers);
    //        notifyListeners();
    //     });
    //
    // }
  }
}
