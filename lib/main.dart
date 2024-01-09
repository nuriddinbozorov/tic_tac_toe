import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String displayExOh = "";
  void _tapped() {
    setState(() {
      displayExOh = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: _tapped,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Text(
                  displayExOh,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
