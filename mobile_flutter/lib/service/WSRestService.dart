import 'package:app_academias/utils/GlobalObjects.dart';
import 'dart:async';
import 'dart:convert';

class WSRestService {
  HttpClient client;
  int qtdSecondsTimeout = 10;
  ConnectionUtil connectionUtil = new ConnectionUtil();

  WSRestService() {
    this.client = new HttpClient();
  }

  Future<HttpClientResponse> request_close(HttpClientRequest request,
      [String bodyJsonEncode = '', Function functionSegundaTentativaToken]) async {
    HttpClientRequest _request = request;

    if (bodyJsonEncode != '') {
      _request.add(utf8.encode(bodyJsonEncode));
    }

    var response = await _request.close();
    return response;
  }

  Future<HttpClientResponse> _requestGet(String url, [String paramUrl = '', bool SegundaTentativaToken = false]) async {
    try {
      client.connectionTimeout = Duration(seconds: qtdSecondsTimeout);

      String urlGet = url;
      if ((paramUrl != null) && (paramUrl.isNotEmpty)) {
        urlGet = url + paramUrl;
      }

      final request = await client.getUrl(Uri.parse(urlGet));
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");

      var response = await request_close(
          request,
          '',
          SegundaTentativaToken
              ? null
              : () {
                  return _requestGet(url, paramUrl, true);
                });

      if (SegundaTentativaToken) {
        return response;
      }

      // print console
      Logger.setLogger("URL: ${urlGet} ", this.runtimeType.toString(), '-_requestGet-');

      return response;
    } catch (ex) {
      //Definindo os tipos de exceção
      String msgErro = ex.toString(); //Mensagem de erro padrão
      if (ex is SocketException) {
        //Erro de conexão, verificando o status da rede
        StatusRede statusRede = await connectionUtil.verificarRede();

        if (statusRede.isRedeAtiva) {
          //Verificando se o usuario esta com o wifi ou dados moveis ligado

          if (statusRede.tipoRede == "WIFI" || statusRede.tipoRede == "MOBILE") {
            //Alterar a mensagem de acordo com o tipo de conexão
            msgErro =
                "Não conseguimos acesso acesso à internet através da sua conexão ${statusRede.getTipoRedeString()} do seu aparelho, certifique-se de que está conectado na internet e tente novamente.";
            throw msgErro;
          } else {
            msgErro = "Verifique  qualidade do sinal de internet e tente novamente.";
            throw msgErro;
          }
        } else {
          //Usuario esta com wifi e redes moveis desconectada
          msgErro = "Seu aparelho não está conectado a internet, por favor ative a rede móvel ou wifi e tente novamente";
          throw msgErro;
        }
      }
      if (ex is TimeoutException) {
        msgErro = "Os nossos servidores estão congestionados, aguarde um instante e tente novamente mais tarde.";
        throw msgErro;
      }
      throw ex;
    }
  }

  Future<bool> sondaWS() async {
    try {
      final request = await client.getUrl(Uri.parse(urlSondaWS));
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");

      var response = await request.close();
      int _httpStatusCode = response.statusCode;

      ///String _body = await response.transform(utf8.decoder).join();
      bool isConexaoWSOk = false;

      //Logger.setLogger("${urlSondaWS}", '', "Sonda");
      switch (_httpStatusCode) {
        case 200:
          {
            isConexaoWSOk = false;

            return isConexaoWSOk;
          }
        case 500:
          {
            //isConexaoWSOk =  false;
            //return isConexaoWSOk;
            throw "Não conseguimos nos comunicar com nossos serviços.\n\nPor Favor tente mais tarde.";
          }
      }
      return null;
    } catch (ex) {
      if (ex is String) {
        throw ex;
      }
      if (ex is SocketException) {
        throw "Não foi possivel verificar a conexão com os nossos serviços. \n\nVerifique a sua conexão de rede e tente novamente";
      }
    }
    return null;
  }

  Future<HttpClientResponse> _requestPut(String url, String bodyJsonEncode, [bool SegundaTentativaToken = false]) async {
    try {
      client.connectionTimeout = Duration(seconds: qtdSecondsTimeout);
      final request = await client.putUrl(Uri.parse(url));
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");

      var response = await request_close(
          request,
          bodyJsonEncode,
          SegundaTentativaToken
              ? null
              : () {
                  return _requestPut(url, bodyJsonEncode, true);
                });

      if (SegundaTentativaToken) {
        return response;
      }

      Logger.setLogger("URL: ${url}", this.runtimeType.toString(), '-_requestPut');

      return response;
    } catch (ex) {
      //Definindo os tipos de exceção
      String msgErro = ex.toString(); //Mensagem de erro padrão

      if (ex is SocketException) {
        //Erro de conexão, verificando o status da rede
        StatusRede statusRede = await connectionUtil.verificarRede();
        if (statusRede.isRedeAtiva) {
          msgErro = "Não conseguimos enviar sua solicitação. Verifique sua conexão com a internet e tente novamente.";
          throw msgErro;
        } else {
          //Verificando se o usuario esta com o wifi ou dados moveis ligado
          if (statusRede.tipoRede == "WIFI" || statusRede.tipoRede == "MOBILE") {
            msgErro = "O seu aparelho não está conectado a internet, por favor verifique sua conexão e tente novamente.";
            throw msgErro;
          } else {
            //Usuario esta com wifi e redes moveis desconectada
            msgErro = "O seu aparelho não está conectado a internet, por favor ative a rede móvel ou wifi e tente novamente";
            throw msgErro;
          }
        }
      }
      if (ex is TimeoutException) {
        msgErro = "Os nossos servidores estão congestionados, aguarde um instante e tente novamente mais tarde.";
        throw msgErro;
      }

      throw ex;
    }
  }

  Future<HttpClientResponse> _requestDelete(String url, [bool SegundaTentativaToken = false]) async {
    try {
      client.connectionTimeout = Duration(seconds: qtdSecondsTimeout);
      final request = await client.deleteUrl(Uri.parse(url));
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");

      var response = await request_close(
          request,
          '',
          SegundaTentativaToken
              ? null
              : () {
                  return _requestDelete(url, true);
                });

      if (SegundaTentativaToken) {
        return response;
      }

      Logger.setLogger("URL: ${url}", this.runtimeType.toString(), '-_requestDelete-');

      return response;
    } catch (ex) {
      //Definindo os tipos de exceção
      String msgErro = ex.toString(); //Mensagem de erro padrão

      if (ex is SocketException) {
        //Erro de conexão, verificando o status da rede
        StatusRede statusRede = await connectionUtil.verificarRede();
        if (statusRede.isRedeAtiva) {
          msgErro = "Não conseguimos enviar sua solicitação. Verifique sua conexão com a internet e tente novamente.";
          throw msgErro;
        } else {
          //Verificando se o usuario esta com o wifi ou dados moveis ligado
          if (statusRede.tipoRede == "WIFI" || statusRede.tipoRede == "MOBILE") {
            msgErro = "O seu aparelho não está conectado a internet, por favor verifique sua conexão e tente novamente.";
            throw msgErro;
          } else {
            //Usuario esta com wifi e redes moveis desconectada
            msgErro = "O seu aparelho não está conectado a internet, por favor ative a rede móvel ou wifi e tente novamente";
            throw msgErro;
          }
        }
      }
      if (ex is TimeoutException) {
        msgErro = "Os nossos servidores estão congestionados, aguarde um instante e tente novamente mais tarde.";
        throw msgErro;
      }

      throw ex;
    }
  }

  Future<HttpClientResponse> _requestPost(
      String url,
      String bodyJsonEncode,
      ) async {
    try {
      client.connectionTimeout = Duration(seconds: qtdSecondsTimeout);
      final request = await client.postUrl(Uri.parse(url));
      request.headers.set(
          HttpHeaders.contentTypeHeader, "application/json; charset=UTF-8");
      request.add(utf8.encode(bodyJsonEncode));

      var response = await request.close();

      Logger.setLogger(
          "URL: ${url}", this.runtimeType.toString(), '-_requestPost-');

      return response;
    } catch (ex) {
      //Definindo os tipos de exceção
      String msgErro = ex.toString(); //Mensagem de erro padrão

      if (ex is SocketException) {
        //Erro de conexão, verificando o status da rede
        StatusRede statusRede = await connectionUtil.verificarRede();
        if (statusRede.isRedeAtiva) {
          msgErro =
          "Houve um problema com a sua rede. Verifique se a sua conexão possui acesso a intenet";
          throw msgErro;
        } else {
          //Verificando se o usuario esta com o wifi ou dados moveis ligado
          if (statusRede.tipoRede == "WIFI" ||
              statusRede.tipoRede == "MOBILE") {
            msgErro =
            "Seu aparelho não está conectado a internet, por favor tente novamente mais tarde.";
            throw msgErro;
          } else {
            //Usuario esta com wifi e redes moveis desconectada
            msgErro =
            "Seu aparelho não está conectado a internet, por favor ative a rede móvel ou wifi e tente novamente";
            throw msgErro;
          }
        }
      }
      if (ex is TimeoutException) {
        msgErro =
        "Erro de conexão, O servidor demorou para responder. Tente novamente mais tarde";
        throw msgErro;
      }

      throw ex;
    }
  }


  Future<List<Pessoa>> getPessoas() async {
    try {
      //https://localhost:8444/cliente/xxx
      HttpClientResponse _response = await _requestGet(urlPessoaGetWS, "");

      String _body = await _response.transform(utf8.decoder).join();
      var jsonObject = jsonDecode(_body);

      if (_response.statusCode == 200) {
        var pessoasJson = jsonObject as List;

        List<Pessoa> pessoaList = pessoasJson.map((e) => Pessoa.fromJSON(e)).toList();
        return pessoaList;
      } else {
        throw "Ops! Não conseguimos acessar o cadastr.\n: ${jsonObject['msg']}";
      }
    } catch (ex, stacktrace) {
      throw ex.toString();
    }
  }


  Future<Pessoa> postPessoa(Pessoa pessoa) async {
    String log = 'Post Pessoa';

    try {
      var param = jsonEncode(pessoa.toJSON());

      Logger.setLogger("postPessoa : ${param.toString()}", "WSRestService", log);

      HttpClientResponse _response = await _requestPost(urlPessoaPostWS, param);

      if ((_response.statusCode == 200) || (_response.statusCode == 201)){

        String urlRequisicao = _response.headers.value('Location');

        if ((pessoa.codigopess??0) == 0) {
          //trata-se de um insert. Vou atribuir o pessoa.codigopess retornado pelo servidor em "location"
          var pos = urlRequisicao.lastIndexOf('/');
          String codigopess = (pos != -1) ? urlRequisicao.substring(pos + 1, urlRequisicao.length) : urlRequisicao;
          pessoa.codigopess = int.parse(codigopess);
        }

        return pessoa;
      } else {

        String _body = await _response.transform(utf8.decoder).join();
        var jsonObject = jsonDecode(_body);
        throw "Houve um erro ao salvar Pessoa: ${jsonObject['message']}";
      }

    } catch (ex, stacktrace) {
      Logger.setLogger(stacktrace.toString(), this.runtimeType.toString(), log);

      throw ex;
    }
  }

  Future<bool> deletePessoa(int codigopess) async {
    String log = 'Del Pessoa';

    try {
      Logger.setLogger("delPessoa : ${codigopess.toString()}", "WSRestService", log);

      HttpClientResponse _response = await _requestDelete(urlPessoaDelWS + '/' + codigopess.toString());

      if (_response.statusCode == 200){
        return true;
      } else {
        String _body = await _response.transform(utf8.decoder).join();
        var jsonObject = jsonDecode(_body);
        throw "Houve um erro ao deletar Pessoa: ${jsonObject['message']}";
      }

    } catch (ex, stacktrace) {
      Logger.setLogger(stacktrace.toString(), this.runtimeType.toString(), log);
      throw ex;
    }
  }

}
