import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_start/pageB.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String contenu = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page A")),
      body: Column(children: [
        TextField(
          onChanged: (value) {
            contenu = value;
            print(contenu);
          },
        ),
        ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('final-kouaou')
                  .add({
                    'nomDeFamille': 'Kouaou',
                    'contenu': contenu,
                  })
                  .then((value) => print("SUCCESS"))
                  .catchError((error) => print("FAILED: $error"));
            },
            child: Text("Ajouter")),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('final-kouaou').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            //display les donnees
            return Expanded(
              child: ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {

                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                  return ListTile(
                    title: Text(data['nomDeFamille']),
                    subtitle: Text(data['contenu']),
                  );


                }).toList(),
              )
            );
          },
        ),
        ElevatedButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const pageB()),
          );

        }, child: Text("Page B"))

        
      ]),
    );
  }
}
