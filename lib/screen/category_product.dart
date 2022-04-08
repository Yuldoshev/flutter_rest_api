import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/screen/product_detail.dart';
import 'package:flutter_and_firebase/services/api_service.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({Key? key, this.categoryName}) : super(key: key);
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName!.toUpperCase(),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiServise().getProductByCategory(categoryName!),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(id: snapshot.data[index]['id']),
                      ));
                    },
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle: Text("Price - \$" +
                        snapshot.data[index]['price'].toString()),
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
