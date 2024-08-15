class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://192.168.10.72:5000/api/";
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";
  //static const String products = '$baseUrl/admin/dashboard/products';

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String getMe = "user/profile/get";
  static const String getToken ="user/token";
  static const String verifyUser = "user/verifyUser";
  
  
// ============Product Routes ==========
  static const String getAllProducts = 'products/get_all_products';
  static const String updateProduct = 'products/update_Product';

  static const String paginatonProducts = 'product/pagination';
  static const int limitPage = 5;
  

  // static const String imageUrl = 'http://10.0.0.2:5000/products/';
  static const String imageUrl = 'http://192.168.10.72:5000/products/';

  // ============Cart Routes ==========
  // static const String addToCart = 'cart/add';
  // static const String getAllCartItems = 'cart/all';
  // static const String deleteCartItem = 'cart/delete/';
  // static const String updateCartItem = 'cart/update/';
  // static const String updateCartStatus = 'cart/status';
  // ===========Cart Routes===========
static const String addToCart = 'cart/add';
static const String getCart = 'cart/all';
static const String updateCart = 'cart/update';
static const String deleteCart = 'cart/delete';


  // ------------------------------Favourite Doctors---------------------------
  static const String getUserFavorites = 'favourite/all';
  static const String addFavorite = 'favourite/add';
  static const String deleteFavorite = 'favourite/delete/';

//=============KhaltiRoutes================
  static const String khalti = 'payment/initialize_khalti';
  static const String completepayment = 'payment/complete-khalti-payment';
}



