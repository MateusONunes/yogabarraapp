import 'package:app_academias/domain/Pessoa.dart';
/**
 * Formulário de Cadastro de Produtos
**/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_academias/utils/GlobalObjects.dart';

class StudentsFormScreen extends StatefulWidget {
  @override
  _StudentsFormScreenState createState() => _StudentsFormScreenState();
}

class _StudentsFormScreenState extends State<StudentsFormScreen> {
  GestorService gestorService = null;

  final _name_persFocusNode = FocusNode();
  final _nickname_persFocusNode = FocusNode();
  final _address_persFocusNode = FocusNode();
  final _city_persFocusNode = FocusNode();
  final _cpf_persFocusNode = FocusNode();
  final _rg_persFocusNode = FocusNode();
  final _birth_persFocusNode = FocusNode();
  final _email_persFocusNode = FocusNode();
  final _phonewhats_persFocusNode = FocusNode();
  final _comments_persFocusNode = FocusNode();

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
      final pessoa =  ModalRoute.of(context).settings.arguments as Pessoa;

      if (pessoa != null) {

        _formData['codigopess'] = pessoa.codigopess;
        _formData['nomepess'] = pessoa.nomepess;
        _formData['nascimentopess'] = pessoa.nascimentopess;
        _formData['enderecopess'] = pessoa.enderecopess;
        _formData['cpfpess'] = pessoa.cpfpess;
        _formData['rgpess'] = pessoa.rgpess;
        _formData['cidadepess'] = pessoa.cidadepess;
        _formData['fonewpess'] = pessoa.fonewpess;
        _formData['fone2pess'] = pessoa.fone2pess;
        _formData['fone3pess'] = pessoa.fone3pess;
        _formData['emailpess'] = pessoa.emailpess;
        _formData['observacoespess'] = pessoa.observacoespess;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _name_persFocusNode.dispose();
    _nickname_persFocusNode.dispose();
    _address_persFocusNode.dispose();
  }

  Future<void> _saveForm() async {
    var isValid = _form.currentState.validate();

    if (!isValid) {
      return;
    }

    _form.currentState.save();

    final pessoa = Pessoa(
        codigopess: _formData['codigopess'],
        nomepess: _formData['nomepess'],
        nascimentopess: _formData['nascimentopess'],
        enderecopess: _formData['enderecopess'],
        cpfpess: _formData['cpfpess'],
        rgpess: _formData['rgpess'],
        cidadepess: _formData['cidadepess'],
        fonewpess: _formData['fonewpess'],
        fone2pess: _formData['fone2pess'],
        fone3pess: _formData['fone3pess'],
        emailpess: _formData['emailpess'],
        observacoespess: _formData['observacoespess']);

    setState(() {
      _isLoading = true;
    });

    final pessoaList = gestorService.pessoaList;

    try {
      await pessoaList.updateInsertPessoa(pessoa);
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
    GestorService gestorService = Provider.of(context);

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: TextFormField(
                            initialValue: _formData['nickname_pers'],
                            decoration: InputDecoration(labelText: 'Apelido'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_nickname_persFocusNode);
                            },
                            onSaved: (value) => _formData['nickname_pers'] = value,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: _formData['city_pers'],
                              decoration: InputDecoration(labelText: 'Cidade'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_city_persFocusNode);
                              },
                              onSaved: (value) => _formData['city_pers'] = value,
                              validator: (value) {
                              return null;
                            },
                        ),
                          ),
                        )                        
                      ],
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
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: TextFormField(
                            initialValue: _formData['rg_pers'],
                            decoration: InputDecoration(labelText: 'RG'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_rg_persFocusNode);
                            },
                            onSaved: (value) => _formData['rg_pers'] = value,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: _formData['cpf_pers'],
                              decoration: InputDecoration(labelText: 'CPF'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_cpf_persFocusNode);
                              },
                              onSaved: (value) => _formData['cpf_pers'] = value,
                              validator: (value) {
                              return null;
                            },
                        ),
                          ),
                        )                        
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: TextFormField(
                            initialValue: _formData['birth_pers'],
                            decoration: InputDecoration(labelText: 'Aniversário'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_birth_persFocusNode);
                            },
                            onSaved: (value) => _formData['birth_pers'] = value,
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: _formData['email_pers'],
                              decoration: InputDecoration(labelText: 'e-mail'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_email_persFocusNode);
                              },
                              onSaved: (value) => _formData['email_pers'] = value,
                              validator: (value) {
                              return null;
                            },
                        ),
                          ),
                        )                        
                      ],
                    ),
                    TextFormField(
                      initialValue: _formData['comments_pers'],
                      decoration: InputDecoration(labelText: 'Observações'),
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      focusNode: _comments_persFocusNode,
                      onSaved: (value) => _formData['comments_pers'] = value,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
