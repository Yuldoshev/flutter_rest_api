import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/services/api_service.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key, required this.id}) : super(key: key);

  late int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        shadowColor: Colors.deepOrange,
        elevation: 10,
      ),
      body: FutureBuilder(
        future: ApiServise().getSingleProduct(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: double.infinity,
                      colorBlendMode: BlendMode.hardLight,
                      gaplessPlayback: true,
                      scale: 3.0,
                      isAntiAlias: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Price - \$" + snapshot.data['price'].toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data['title'],
                      style: GoogleFonts.roboto(fontSize: 25),
                    ),
                    Chip(
                      label: Text(
                        snapshot.data['category'].toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshot.data['description'],
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ApiServise().updateCart(1, id);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product added to cart")));
        },
        child: const Icon(
          Icons.add_shopping_cart_outlined,
        ),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
