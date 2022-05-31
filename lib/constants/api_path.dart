class Urls {
  // App's base url
  static const String baseUrl = "azelpo.com";

  // Image url
  static String imagePath(String imagePath) => "http://$baseUrl/$imagePath";

  //Sign In url
  static const String  signIn = "/api/login";

  //Sign up url
  static const String  signUp = "/api/register";

  //Service Category url
  static const String  serviceCategory = "/api/service-categories";

  //Service subcategory url
  static const String  serviceSubCategory = "/api/service-subcategories?service_category_id=15";

  //
  static const String  getServiceProvider = "/api/get-service-provider";

  //
  static const String  getProfessional = "/api/get-professionals";
}
