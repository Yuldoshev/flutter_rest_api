import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/services/api_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: ApiServise().getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: ApiServise()
                      .getSingleProduct(products[index]['productId']),
                  builder: (context, AsyncSnapshot ayncSnapshot) {
                    if (ayncSnapshot.hasData) {
                      return ListTile(
                        title: Text(ayncSnapshot.data['title']),
                        leading: Image.network(ayncSnapshot.data['image']),
                        subtitle: Text("Quantity - " +
                            products[index]['quantity'].toString()),
                        trailing: IconButton(
                          onPressed: () async {
                            await ApiServise().deleteCart('1');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Item deleted successfully"),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    return const LinearProgressIndicator();
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.orange,
        child: const Center(
          child: Text(
            "Order Now",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
