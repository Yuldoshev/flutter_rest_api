import 'dart:convert';

import 'package:flutter_and_firebase/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServise {
  Future<List<Product>> getAllPosts() async {
    final allProductsUrl = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(allProductsUrl));
    List<Product> list = [];
    List body = json.decode(response.body);
    body.forEach((product) {
      list.add(Product.fromJson(product));
    });
    print(response.statusCode);
    print(response.body);

    return list;
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

  Future getCart(String userId) async {
    final fetchCartProductUrl = "https://fakestoreapi.com/carts/$userId";
    final response = await http.get(Uri.parse(fetchCartProductUrl));

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }

  Future loginUser(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    final response = await http.post(loginUrl, body: {
      "username": username,
      "password": password,
    });

    print(response.statusCode);
    print(response.body);

    return json.decode(response.body);
  }

  //Post Request
  Future updateCart(int userId, int productId) async {
    final updateCardUrl = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.put(updateCardUrl, body: {
      "userId": "${userId}",
      "date": DateTime.now().toString(),
      "products": [
        {
          "productId": "$productId",
          "quantity": "1",
        }
      ]
    });
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  //Delete reques

  Future deleteCart(String userId) async {
    final deleteCart = Uri.parse("https://fakestoreapi.com/carts/$userId");
    final response = await http.delete(deleteCart);
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future userAuthentication(String usernmae, String password) async {
    final authUrl = Uri.parse("https://api.somewhere.io");
    final response = await http.post(authUrl, body: {
      'username': usernmae,
      'password': password,
    });

    print(response.statusCode);
    print(response.body);
  }

  Future userAuthorization(String usernmae, String password) async {
    final authUrl = Uri.parse("https://api.somewhere.io");
    final basicAuth =
        "Basic " + base64Encode(utf8.encode("$usernmae:$password"));

    final accessToken = "Access token value";
    final response = await http.get(authUrl, headers: {
      "Content-Type": "application/json",
      "authorization": "Bearer $accessToken",
    });

    print(response.statusCode);
    print(response.body);
  }
}
