import 'package:app_academias/utils/GlobalObjects.dart';
import 'package:connectivity/connectivity.dart';

class ConnectionUtil {
  bool isConectado = false;

  Future<StatusRede> verificarRede() async {
    try {
      // verificar qual o tipo de conexao esta ativa no aparelho, wi-fi , dados moveis ou ambos desligados
      var connectivityResult = await Connectivity().checkConnectivity(); // User defined class
      bool isRedeAtiva;
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
          isRedeAtiva = await _checarConexaoInternet();
          return StatusRede("WIFI", isRedeAtiva);
          break;
        case ConnectivityResult.mobile:
          isRedeAtiva = await _checarConexaoInternet();
          return StatusRede("MOBILE", isRedeAtiva);

          break;
        case ConnectivityResult.none:
          isRedeAtiva = await _checarConexaoInternet();
          return StatusRede("NONE", isRedeAtiva);

          break;
      }
    } catch (ex) {
      Logger.setLogger(ex.toString(), this.runtimeType.toString(), '-getListCategoriaWS-');
      if (ex is String) {
        throw ex;
      } else {
        Logger.setLogger(ex.runtimeType.toString() + " Erro = " + ex.toString(), this.runtimeType.toString(), "Verificar conexão");
      }
    }
    return null;
  }

  //Metodo para verificar se existe conexao com a internet, pois o erro de conexao pode
  //acontecer por dois motivos, falta de conexao o aparelho ou o WS Rest está fora de funcionamento.

  Future<bool> _checarConexaoInternet() async {
    try {
      WSRestService wsRestService = new WSRestService();

      //Tenta se conectar ao google para verificar se a rede está ok
      final result = await InternetAddress.lookup('google.com');
      //Se a conexão for feita com sucesso o objeto result ira estar preenchido com uma lista de ips ou um ip
      //Nesse caso existe conexão com a rede
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConectado = true;
      } else {
        //Result retornou vazio, não existe conexão
        isConectado = false;
      }
      // verificar se existe conexao com WS REst, caso tenha sucesso em ping na url da Google
      if (isConectado) {
        try {
          //Chamando o metodo de sonda, ele pode retornar true caso o WS esteja funcionando
          //ou uma exceção com a mensagem. (Caso ocorra a exceção, a mensagem sera jogada até a UI)
          bool isConectadoWS = await wsRestService.sondaWS();
          if (isConectadoWS) {
            isConectado = isConectadoWS;
            return isConectado;
          }
        } catch (ex) {
          throw ex;
        }
      }
    } on SocketException catch (_) {
      isConectado = false;
    }

    return isConectado;
  }
}

class StatusRede {
  String tipoRede;
  bool isRedeAtiva;

  StatusRede(this.tipoRede, this.isRedeAtiva);

  @override
  String toString() {
    return 'StatusRede{tipoRede: $tipoRede, isRedeAtiva: $isRedeAtiva}';
  }

  String getTipoRedeString() {
    if (this.tipoRede == "WIFI") {
      return "Wi-Fi";
    }
    if (this.tipoRede == "MOBILE") {
      return "Dados Móveis";
    } else {
      return "Desconectado";
    }
  }
}

class Logger {
  static bool loggerOn = true;

  static void setLogger(String log, String className, String method) {
    if (loggerOn) {
      print(DateTime.now().toString());
      if (!className.isEmpty) {
        print('****** Classe: ${className}');
      }
      if (!method.isEmpty) {
        print('****** Method: ${method}');
      }
      print(log);
      print('*****************************************');
    }
  }
}
