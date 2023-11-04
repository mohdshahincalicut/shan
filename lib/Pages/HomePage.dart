import 'package:e_com/ApiRequest.dart';
import 'package:e_com/ApiResponce.dart';
import 'package:e_com/Constants/Constants.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  getdDetails() async {
    apiResponce = await getUsersApi();
    print("test 1");
    print(apiResponce.statusCode);
    if (apiResponce.statusCode == 200) {
      print(apiResponce.data['users'][0]["name"]);
    } else {
      print("error from api,its not 200 statuscode");
    }
  }
  // int _counter = 0;

  ApiRequest apiRequest = ApiRequest();
  late ApiResponce apiResponce;

  Future<ApiResponce> getUsersApi() async {
    return apiRequest.apiRequestGet(AppUrls.urlUser);
  }

  void _incrementCounter() async {
    apiResponce = await getUsersApi();
    print("test 1");
    print(apiResponce.statusCode);
    if (apiResponce.statusCode == 200) {
      print(apiResponce.data['users'][0]["name"]);
    } else {
      print("error from api,its not 200 statuscode");
    }

    print("test 2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 110, 218),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  fixedSize: const Size(300, 40),
                  shadowColor: Colors.black,
                  elevation: 15,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Users');
                },
                child: const Text(
                  'USERS',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
