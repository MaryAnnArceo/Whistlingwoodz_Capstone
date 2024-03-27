// ignore_for_file: empty_constructor_bodies, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserID extends StatelessWidget{
  final String documentId;

  GetUserID({required this.documentId});


  @override  
  Widget build(BuildContext context){
    //get collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:((context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text("${data['uid']}");
      }
      return(Text('loading'));
    }));
  }
}

