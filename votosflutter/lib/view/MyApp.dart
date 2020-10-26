import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    List<String> lista = ['nombre1','Nombre2','Nombre 3'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Vote for a Project',
            //style: GoogleFonts.pacifico,
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Project').snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData) return Text('Loading...');
            if(snapshot.data.documents.length == 0){
              return Center(
                child: Text('No documents'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext,int index){
                DocumentSnapshot data = snapshot.data.documents[index];
                return ListTile(
                  title: Text(
                    data['project_name'],
                  ),
                  subtitle: Text(data['author']),
                  trailing: Text(data['votes']),
                );
              },
            );
          },
        ),
            ),
    );
    throw UnimplementedError();
  }
  
}