import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserExercises extends StatefulWidget {

  @override
  _UserExercisesState createState() => _UserExercisesState();
}

class _UserExercisesState extends State<UserExercises> {

  String exerciseTitle = "";

  createExercises(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyExercises").doc(exerciseTitle);

    Map<String, String> myExercises = {
      "exerciseTitle":exerciseTitle
    };

    documentReference.set(myExercises).whenComplete((){
      print("$exerciseTitle created");
    });
  }

  deleteExercises(item){

    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyExercises").doc(item);

    documentReference.delete().whenComplete(() {
      print("$item deleted");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add an exercise"),
                  content: TextField(
                    onChanged: (String value) {
                      exerciseTitle = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(onPressed: () {
                      createExercises();
                      Navigator.of(context).pop();
                    },
                    child: Text("Add"))
                  ],
                );
              }
          );
        },
        child: Icon(
            Icons.add,
            color: Colors.white
        ),
      ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("MyExercises").snapshots(),
          builder: (context, snapshots) {
        return ListView.builder(
          shrinkWrap: true,
            itemCount: snapshots.data.documents.length,
            itemBuilder: ( context, index) {
              DocumentSnapshot documentSnapshot = snapshots.data.documents[index];
              return Dismissible(
                onDismissed: (direction){
                  deleteExercises(documentSnapshot["exerciseTitle"]);
                },
                  key: Key(documentSnapshot["exerciseTitle"]),
                  child: Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: ListTile(
                  title: Text(documentSnapshot["exerciseTitle"]),
                  trailing: IconButton (
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: (){
                      deleteExercises(documentSnapshot["exerciseTitle"]);
                    },
                  ),
                ),
              ));
            }
        );
          }
          )
    );
  }
}