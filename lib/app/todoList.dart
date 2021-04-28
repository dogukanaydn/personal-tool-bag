import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class TodoList extends StatefulWidget {
  // TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('todolist');

  void addUser(String name) {
    users.add({'name': name});
    myController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a Todo',
                ),
              ),
              ElevatedButton(
                onPressed: () => addUser(myController.text),
                child: Text('ADD'),
              ),
              SizedBox(
                height: 50,
              ),
              UserInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('todolist');

    Future<void> deleteUser(DocumentReference reference) {
      return reference.delete();
    }

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 16.0),
                    height: 50,
                    color: Colors.amber[600],
                    child: new ListTile(
                      title: new Text(snapshot.data.docs[index]['name']),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            deleteUser(snapshot.data.docs[index].reference),
                      ),
                    ),
                  );
                }),
          );
        }
        return Text('Hata Var');
      },
    );
  }
}
