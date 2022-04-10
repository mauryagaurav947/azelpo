class Urls {
  // App's base url
  static const String baseUrl = "api.intellezen.com";

  // Image url
  static String imagePath(String imagePath) => "https://$baseUrl/$imagePath";
}
