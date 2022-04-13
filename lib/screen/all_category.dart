import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/screen/category_product.dart';
import 'package:flutter_and_firebase/services/api_service.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiServise().getAllCategory(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryProductScreen(
                          categoryName: snapshot.data[index]),
                    ));
                  },
                  child: Card(
                    elevation: 10,
                    borderOnForeground: true,
                    shadowColor: Colors.orange[50],
                    margin: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          snapshot.data[index].toString().toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
