import 'package:app_academias/utils/GlobalObjects.dart';

class PessoaList{
  List<Pessoa> items = [];

  int get itemsCount => items.length;

  Future<void> carregarPessoas() async {
    items = await globalGestorservice.ws.getPessoas();
    print('x');
    return Future.value();
  }

  Future<void> updateInsertPessoa(Pessoa pessoaUpdate) async {
    // int code_pers = 100;
    //
    // if (newPerson_pers.code_pers != null){
    //   code_pers = int.parse(newPerson_pers.code_pers);
    // } else {
    //   Firestore db = Firestore.instance;
    //   QuerySnapshot querySnapshot = await db
    //     .collection("sequence")
    //     .getDocuments();
    //
    //   for(DocumentSnapshot item in querySnapshot.documents) {//TODO - Tirar do Laço
    //     var dados = item.data;
    //     code_pers = dados['code_pers'];
    //   }
    //
    //   code_pers++;
    //
    //   Firestore.instance.collection("sequence").document('1').setData({"code_pers": code_pers});
    // }
    //
    // Firestore.instance.collection("person_pers").document(code_pers.toString()).setData(
    //   {
    //     "id": code_pers,
    //     "code_pers": code_pers,
    //     "name_pers": newPerson_pers.name_pers,
    //     "nickname_pers": newPerson_pers.nickname_pers,
    //     "address_pers": newPerson_pers.address_pers,
    //     "city_pers": newPerson_pers.city_pers,
    //     "cpf_pers": newPerson_pers.cpf_pers,
    //     "rg_pers": newPerson_pers.rg_pers,
    //     "birth_pers": newPerson_pers.birth_pers,
    //     "phonewhats_pers": newPerson_pers.phonewhats_pers,
    //     "email_pers": newPerson_pers.email_pers,
    //     "comments_pers": newPerson_pers.comments_pers,
    //   }
    // );
    //
    // if (newPerson_pers.code_pers == null) {
    //   _items.add(Person_pers(
    //     id: code_pers.toString(),
    //     code_pers: code_pers.toString(),
    //     name_pers: newPerson_pers.name_pers,
    //     nickname_pers: newPerson_pers.nickname_pers,
    //     address_pers: newPerson_pers.address_pers,
    //     city_pers: newPerson_pers.city_pers,
    //     cpf_pers: newPerson_pers.cpf_pers,
    //     rg_pers: newPerson_pers.rg_pers,
    //     birth_pers: newPerson_pers.birth_pers,
    //     phonewhats_pers: newPerson_pers.phonewhats_pers,
    //     email_pers: newPerson_pers.email_pers,
    //     comments_pers: newPerson_pers.comments_pers,
    //   ));
    // } else {
    //   final indexPerson = _items.indexWhere((person) => person.id == newPerson_pers.id);
    //   _items[indexPerson] = newPerson_pers;
    // }
    // notifyListeners();
  }

  Future<void> deletePessoa(int codigopess) async {
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