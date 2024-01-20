class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  static const String baseUrl = "http://10.0.2.2:5000/api/";
  // For MAC
  // static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  //? ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";

  //? ===================== Product Routes==========================
  static const String getAllProduct = "product/get_products";

  static  String token = '';


}
