import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

loadModel() async {
  await Tflite.loadModel(
    model: "assets/model_exp(2).tflite",
    labels: "assets/labels_exp.txt",
  );
}

abstract class Quoter {
  String getQuote(int index);
}

class AngryQuotes extends Quoter {
  var quotes = {0: "angry me", 1: "angry you"};

  @override
  String getQuote(int index) {
    return quotes[index];
  }
}

class DisgustQuotes extends Quoter {
  var quotes = {0: "digust me", 1: "disgust you"};

  @override
  String getQuote(int index) => quotes[index];
}

class FearQuotes extends Quoter {
  var quotes = {0: "fear me", 1: "fear you"};

  @override
  String getQuote(int index) => quotes[index];
}

class HappyQuotes extends Quoter {
  var quotes = {0: "happy me", 1: "happy you"};

  @override
  String getQuote(int index) => quotes[index];
}

class SadQuotes extends Quoter {
  var quotes = {0: "sad me", 1: "sad you"};

  @override
  String getQuote(int index) => quotes[index];
}

class SurpriseQuotes extends Quoter {
  var quotes = {0: "surprise me", 1: "surprise you"};

  @override
  String getQuote(int index) => quotes[index];
}

void main(List<String> arguments) async {
  // load model
  // prediksi
  var output = 2;

  switch (output) {
    case 1:
      {
        var selectedQuotes = AngryQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
    case 2:
      {
        var selectedQuotes = DisgustQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
    case 3:
      {
        var selectedQuotes = DisgustQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
    case 4:
      {
        var selectedQuotes = DisgustQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
    case 5:
      {
        var selectedQuotes = DisgustQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
    case 6:
      {
        var selectedQuotes = DisgustQuotes();
        var index = Random().nextInt(2);
        print(selectedQuotes.getQuote(index));
        break;
      }
  }
}

// class exp_quo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//             title: Text("Real_you")
//         ),
//         body: Center(
//           child: RaisedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//           ),
//         )
//     );