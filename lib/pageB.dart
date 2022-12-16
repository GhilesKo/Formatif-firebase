import 'package:dio/dio.dart';
import 'package:firebase_start/pageC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pageB extends StatefulWidget {
  const pageB({Key? key}) : super(key: key);

  @override
  State<pageB> createState() => _pageBState();
}

class _pageBState extends State<pageB> {
  String contenu = "";

  Future<void> envoiRequete() async {
    Dio dio = new Dio();
    try {
      var response = await dio.post("http://10.0.2.2:8080/exos/error/or/not/",
          data: {"nom": contenu});
      final snackBar = SnackBar(content: const Text('Yeah tout est beau'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //print(response);
    } on DioError catch (e) {
   final snackBar2 = SnackBar(content:  Text('NON ' + e.response.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
      ),
      body: Column(
        children: [
          TextField(onChanged: (value) {
            contenu = value;
            print(contenu);
          }),
          ElevatedButton(onPressed: envoiRequete, child: Text("Press")),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const pageC()),
            );
          }, child: Text("Page C"))
        ],
      ),
    );
  }
}
