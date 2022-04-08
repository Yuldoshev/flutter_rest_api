import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Shop"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
