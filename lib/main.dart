import 'package:flutter/material.dart';
import 'app/calculator.dart';
import 'firebase/firebaseConnection.dart';
import 'app/photogallery.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/calculator': (context) => Calculator(),
        '/app': (context) => App(),
        '/photogallery': (context) => PhotoGallery(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Go to calculator'),
              onPressed: () {
                Navigator.pushNamed(context, '/calculator');
              },
            ),
            ElevatedButton(
              child: Text('Go to TodoList'),
              onPressed: () {
                Navigator.pushNamed(context, '/app');
              },
            ),
            ElevatedButton(
              child: Text('Go to Photo Gallery'),
              onPressed: () {
                Navigator.pushNamed(context, '/photogallery');
              },
            ),
          ],
        ),
      ),
    );
  }
}
