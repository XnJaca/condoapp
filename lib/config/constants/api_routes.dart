// ignore_for_file: constant_identifier_names

class ApiRoute {
  static const String USER_STOREGE = 'user_storage';
  static const String USER_TOKEN = 'token_storage';
  static const String BASE_URL =
      'https://mi33iaj32m.execute-api.us-east-1.amazonaws.com/dev/';
  static const String AUTHENTICATE = 'auth/login';
  static const String CONDOMINIOS = 'condominium/person/';
  static const String FINCAS = 'property/condominium/';
  static const String FINCA_DETAIL = 'property/';
  static const String RESET_PASSWORD = '${BASE_URL}recoverpassword';
  static const String USER = '${BASE_URL}person';
  static const String GET_USER = '${BASE_URL}person/';
  static const String MESSAGE = '${BASE_URL}message/new/';
  static const String MESSAGE_RECIVED = '${BASE_URL}message/received/';
  static const String MESSAGE_SENT = '${BASE_URL}message/sent/';
  static const String POSTS_RECIEVED = '${BASE_URL}post/received/';
  static const String GET_VISITORS = '${BASE_URL}visitor/person/';
  static const String POST_VISITORS = '${BASE_URL}visitor';
}
