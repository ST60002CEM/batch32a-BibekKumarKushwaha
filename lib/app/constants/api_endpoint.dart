class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:5000/api/";
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";
  //static const String products = '$baseUrl/admin/dashboard/products';

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  
  
// ============Product Routes ==========
  static const String getAllProducts = 'products/get_all_products';
  static const String updateProduct = 'products/update_Product';

  static const String paginatonProducts = 'product/pagination';
  static const int limitPage = 5;

  // static const String imageUrl = 'http://192.168.1.133:5000/products/'
  static const String imageUrl = 'http://10.0.2.2:5000/products/';
}


