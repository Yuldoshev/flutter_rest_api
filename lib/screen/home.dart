import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/screen/all_category.dart';
import 'package:flutter_and_firebase/screen/product_detail.dart';
import 'package:flutter_and_firebase/services/api_service.dart';

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
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllCategory(),
              ));
            },
            icon: const Icon(Icons.view_list),
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
          }),
    );
  }
}
