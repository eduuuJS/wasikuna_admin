// ignore_for_file: constant_identifier_names

enum ENV {
  DESA,
  QA,
  PROD,
}

extension Environment on ENV {
  static ENV type = ENV.DESA;
  static Map<String, dynamic> get appConfig {
    switch (type) {
      case ENV.DESA:
        return {
          "enviroment": "DESAROLLO",
          "baseUrl": "http://192.168.18.53:3000",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
          "sendTimeout": 600000,
        };
      case ENV.QA:
        return {
          "enviroment": "QA",
          "baseUrl": "",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      case ENV.PROD:
        return {
          "enviroment": "PRODUCCIÓN",
          "baseUrl": "",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      default:
        return {
          "": "",
        };
    }
  }
}
