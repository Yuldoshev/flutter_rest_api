import 'package:flutter/material.dart';
import 'package:flutter_and_firebase/screen/home.dart';
import 'package:flutter_and_firebase/services/api_service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Shop"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.orange, BlendMode.color),
                child: Image.asset("assets/images.jpeg"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "password", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange[300],
                    textStyle:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  final getToken = await ApiServise()
                      .loginUser(nameController.text, passwordController.text);

                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "SUCCESS your token - ${getToken['token']}",
                      ),
                      backgroundColor: Colors.green,
                    ));
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("UserName or Password incorrect"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
