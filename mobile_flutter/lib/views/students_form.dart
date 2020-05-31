/**
 * Formulário de Cadastro de Produtos
**/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/person_pers.dart';
import 'package:shop/providers/person_perss.dart';

class StudentsFormScreen extends StatefulWidget {
  @override
  _StudentsFormScreenState createState() => _StudentsFormScreenState();
}

class _StudentsFormScreenState extends State<StudentsFormScreen> {
  final _name_persFocusNode = FocusNode();
  final _address_persFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final person_pers = ModalRoute.of(context).settings.arguments as Person_pers;

      if (person_pers != null) {
        _formData['id'] = person_pers.id;
        _formData['code_pers'] = person_pers.code_pers;
        _formData['name_pers'] = person_pers.name_pers;
        _formData['address_pers'] = person_pers.address_pers;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _name_persFocusNode.dispose();
    _address_persFocusNode.dispose();
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();

    final person_pers = Person_pers(
      id: _formData['id'],
      code_pers: _formData['code_pers'],
      name_pers: _formData['name_pers'],
      address_pers: _formData['address_pers'],
    );

    setState(() {
      _isLoading = true;
    });

    final person_perss = Provider.of<Person_perss>(context, listen: false);

    try {
      if (_formData['id'] == null) {
        await person_perss.addPerson_pers(person_pers);
      } else {
        await person_perss.updatePerson_pers(person_pers);
      }
      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro!'),
          content: Text('Ocorreu um erro pra salvar o aluno!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Fechar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário Aluno'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _formData['name_pers'],
                      decoration: InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_name_persFocusNode);
                      },
                      onSaved: (value) => _formData['name_pers'] = value,
                      validator: (value) {
                        bool isEmpty = value.trim().isEmpty;
                        bool isInvalid = value.trim().length < 3;

                        if (isEmpty || isInvalid) {
                          return 'Informe um Título válido com no mínimo 3 caracteres!';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['address_pers'],
                      decoration: InputDecoration(labelText: 'Endereço'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_address_persFocusNode);
                      },
                      onSaved: (value) => _formData['address_pers'] = value,
                      validator: (value) {
                        bool isEmpty = value.trim().isEmpty;
                        bool isInvalid = value.trim().length < 3;

                        //if (isEmpty || isInvalid) {
                        //  return 'Informe um Título válido com no mínimo 3 caracteres!';
                        //}

                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
