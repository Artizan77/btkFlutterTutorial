import 'package:bloc_sample/models/product.dart';

class ProductService {
  static List<Product> products = new List<Product>();
  static ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll() {
    products.add(new Product(1, "Acer Laptop", 2000));
    products.add(new Product(2, "Lenovo Laptop", 3000));
    products.add(new Product(3, "asus Laptop", 4000));
    return products;
  }
}
