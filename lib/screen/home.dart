import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/model/model.dart';
import 'package:flutter_and_firebase/screen/all_category.dart';
import 'package:flutter_and_firebase/screen/cart_screen.dart';
import 'package:flutter_and_firebase/screen/product_detail.dart';
import 'package:flutter_and_firebase/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AllCategory(),
              ));
            },
            icon: const Icon(Icons.view_list),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: FutureBuilder(
          future: ApiServise().getAllPosts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Product product = snapshot.data[index];
                    return Card(
                      elevation: 5.0,
                      shadowColor: Colors.orange[200],
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: Card(
                        elevation: 6.0,
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.orange[100]!, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetail(id: product.id),
                            ));
                          },
                          title: Text(
                            product.title,
                            style: GoogleFonts.roboto(fontSize: 14),
                          ),
                          leading: Image.network(
                            product.image,
                            height: 50,
                            width: 30,
                            colorBlendMode: BlendMode.softLight,
                          ),
                          subtitle: Text(
                            "Price - \$" + product.price.toString(),
                            style: GoogleFonts.roboto(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
