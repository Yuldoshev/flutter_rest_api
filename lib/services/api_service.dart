import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServise {
  Future getAllPosts() async {
    final allProductsUrl = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(allProductsUrl));

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }

  Future getSingleProduct(int id) async {
    final singleProductsUrl = "https://fakestoreapi.com/products/$id";
    final response = await http.get(Uri.parse(singleProductsUrl));

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }

  Future getAllCategory() async {
    final allCategoryUrl = "https://fakestoreapi.com/products/categories";
    final response = await http.get(Uri.parse(allCategoryUrl));

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }

  Future getProductByCategory(String catName) async {
    final fetchCategoryProductUrl =
        "https://fakestoreapi.com/products/category/$catName";
    final response = await http.get(Uri.parse(fetchCategoryProductUrl));

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }
}
