import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JankenPage()
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  static const String goo = '✊';
  static const String choki = '✌️';
  static const String par = '🖐';
  String myHand = goo;
  String computerHand = goo;
  String result = '引き分け';

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == goo && computerHand == choki) {
      result = '勝ち';
    } else if (myHand == choki && computerHand == par) {
      result = '勝ち';
    } else if (myHand == par && computerHand == goo) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  String randomNumberToHand(int randomNumber) {
    switch(randomNumber) {
      case 0:
        return goo;
      case 1:
        return choki;
      case 2:
        return par;
      default:
        return goo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 32
              ),
            ),
            const SizedBox(height: 48),
            Text(
              computerHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand(goo);
                  },
                  child: const Text(goo)
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(choki);
                  },
                  child: const Text(choki)
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(par);
                  },
                  child: const Text(par)
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}