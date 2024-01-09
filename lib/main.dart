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
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  bool ohTurn = true; // Birinchi o'yinchi = O
  void _tapped(int index) {
    setState(() {
      if (ohTurn) {
        displayExOh[index] = 'O';
      } else {
        displayExOh[index] = 'X';
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    //1-qator
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      checkWinnerDialog();
    }
    //2-qator
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      checkWinnerDialog();
    }
    //3-qator
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      checkWinnerDialog();
    }
    //1-qator
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      checkWinnerDialog();
    }
    //2-qator
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      checkWinnerDialog();
    }
    //3-qator
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      checkWinnerDialog();
    }
    //1-dioganal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      checkWinnerDialog();
    }
    //2-dioganal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      checkWinnerDialog();
    }
  }

  void checkWinnerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text('Winner is: ' + (ohTurn ? 'X' : 'O')));
      },
    );
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
            onTap: () {
              _tapped(index);
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Text(
                  displayExOh[index],
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
