class Urls {
  static String baseURl = "https://dummyjson.com";
  static String readProduct = "$baseURl/products";
  static String deleteProduct(String id) => "$baseURl/products/$id";
}
