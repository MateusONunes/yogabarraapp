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

  // final _codigopessFocusNode = FocusNode():
  final _nomepessFocusNode = FocusNode();
  final _apelidopessFocusNode = FocusNode();
  final _nascimentopessFocusNode = FocusNode();
  final _enderecopessFocusNode = FocusNode();
  final _cpfpessFocusNode = FocusNode();
  final _rgpessFocusNode = FocusNode();
  final _cidadepessFocusNode = FocusNode();
  final _fonewpessFocusNode = FocusNode();
  final _fone2pessFocusNode = FocusNode();
  final _fone3pessFocusNode = FocusNode();
  final _emailpessFocusNode = FocusNode();
  final _observacoespessFocusNode = FocusNode();

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
        _formData['apelidopess'] = pessoa.apelidopess;
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
        apelidopess: _formData['apelidopess'],
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
      gestorService.notifyListeners();
      Navigator.of(context).pop();
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Ocorreu um erro!'),
          content: Text('Ocorreu um erro ao salvar o aluno\n${error.toString()}'),
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
    gestorService = Provider.of(context);

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
                      initialValue: _formData['nomepess'],
                      decoration: InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_nomepessFocusNode);
                      },
                      onSaved: (value) => _formData['nomepess'] = value,
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
                            initialValue: _formData['apelidopess'],
                            decoration: InputDecoration(labelText: 'Apelido'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_apelidopessFocusNode);
                            },
                            onSaved: (value) => _formData['apelidopess'] = value,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              initialValue: _formData['cidadepess'],
                              decoration: InputDecoration(labelText: 'Cidade'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_cidadepessFocusNode);
                              },
                              onSaved: (value) => _formData['cidadepess'] = value,
                              validator: (value) {
                              return null;
                            },
                        ),
                          ),
                        )                        
                      ],
                    ),
                    TextFormField(
                      initialValue: _formData['enderecopess'],
                      decoration: InputDecoration(labelText: 'Endereço'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_enderecopessFocusNode);
                      },
                      onSaved: (value) => _formData['enderecopess'] = value,
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
                            initialValue: _formData['rgpess'],
                            decoration: InputDecoration(labelText: 'RG'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_rgpessFocusNode);
                            },
                            onSaved: (value) => _formData['rgpess'] = value,
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
                              initialValue: _formData['cpfpess'],
                              decoration: InputDecoration(labelText: 'CPF'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_cpfpessFocusNode);
                              },
                              onSaved: (value) => _formData['cpfpess'] = value,
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
                            initialValue: _formData['nascimentopess'],
                            decoration: InputDecoration(labelText: 'Aniversário'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_nascimentopessFocusNode);
                            },
                            onSaved: (value) => _formData['nascimentopess'] = value,
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
                              initialValue: _formData['emailpess'],
                              decoration: InputDecoration(labelText: 'e-mail'),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(_emailpessFocusNode);
                              },
                              onSaved: (value) => _formData['emailpess'] = value,
                              validator: (value) {
                              return null;
                            },
                        ),
                          ),
                        )                        
                      ],
                    ),
                    TextFormField(
                      initialValue: _formData['observacoespess'],
                      decoration: InputDecoration(labelText: 'Observações'),
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      focusNode: _observacoespessFocusNode,
                      onSaved: (value) => _formData['observacoespess'] = value,
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
