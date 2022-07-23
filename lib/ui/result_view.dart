import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';


class ResultView extends StatefulWidget {
  final String resultClassification;
  const ResultView({Key key, this.resultClassification}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  List<String> idExpression = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',

  ];
  List<double> exp = [];
  Map<String, double> expquo;
  // List<exp> expresquo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exp = widget.resultClassification as List<double>;
    // expquo = exp.fetchAll();
    log(calculateAngry().toString());
    log(calculateDisgust().toString());
    log(calculateFear().toString());
    log(calculateHappy().toString());
    log(calculateSad().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Mood!'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.lightGreen])),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[]),
      ),
    );
  }

  num calculateAngry() {
    // List<num> cf = [];
    //
    // num cfGabungan = cf.first;
    // for (int i = 1; i < cf.length; i++) {
    //   if ((cfGabungan > 0) && (cf[i] > 0)) {
    //     cfGabungan = _hitungCfPositif(cfGabungan, cf[i]);
    //   } else if ((cfGabungan < 0) && (cf[i] < 0)) {
    //     cfGabungan = _hitungCfNgeatif(cfGabungan, cf[i]);
    //   } else {
    //     cfGabungan = _hitungCfBeda(cfGabungan, cf[i]);
    //   }
    // }
    // return cfGabungan * 100;
  }

  num calculateDisgust() {
    List<num> cf = [];
  }

  num calculateFear() {
    //   List<num> cf = [];
    //
    //   num cfGabungan = cf.first;
    //   for (int i = 1; i < cf.length; i++) {
    //     if ((cfGabungan > 0) && (cf[i] > 0)) {
    //       cfGabungan = _hitungCfPositif(cfGabungan, cf[i]);
    //     } else if ((cfGabungan < 0) && (cf[i] < 0)) {
    //       cfGabungan = _hitungCfNgeatif(cfGabungan, cf[i]);
    //     } else {
    //       cfGabungan = _hitungCfBeda(cfGabungan, cf[i]);
    //     }
    //   }
    //   return cfGabungan * 100;
  }

  num calculateHappy() {
    // List<num> cf = [];

    // for (int i = 1; i < cf.length; i++) {
    //   if ((cfGabungan > 0) && (cf[i] > 0)) {
    //     cfGabungan = _hitungCfPositif(cfGabungan, cf[i]);
    //   } else if ((cfGabungan < 0) && (cf[i] < 0)) {
    //     cfGabungan = _hitungCfNgeatif(cfGabungan, cf[i]);
    //   } else {
    //     cfGabungan = _hitungCfBeda(cfGabungan, cf[i]);
    //   }
    // }
    // return cfGabungan * 100;
  }

  num calculateSad() {
    // List<num> cf = [];
    //
    // num cfGabungan = cf.first;
    // for (int i = 1; i < cf.length; i++) {
    //   if ((cfGabungan > 0) && (cf[i] > 0)) {
    //     cfGabungan = _hitungCfPositif(cfGabungan, cf[i]);
    //   } else if ((cfGabungan < 0) && (cf[i] < 0)) {
    //     cfGabungan = _hitungCfNgeatif(cfGabungan, cf[i]);
    //   } else {
    //     cfGabungan = _hitungCfBeda(cfGabungan, cf[i]);
    //   }
    // }
    // return cfGabungan * 100;
  }
  num calculateSurprise() {
    //   List<num> cf = [];
    //
    //   num cfGabungan = cf.first;
    //   for (int i = 1; i < cf.length; i++) {
    //     if ((cfGabungan > 0) && (cf[i] > 0)) {
    //       cfGabungan = _hitungCfPositif(cfGabungan, cf[i]);
    //     } else if ((cfGabungan < 0) && (cf[i] < 0)) {
    //       cfGabungan = _hitungCfNgeatif(cfGabungan, cf[i]);
    //     } else {
    //       cfGabungan = _hitungCfBeda(cfGabungan, cf[i]);
    //     }
    //   }
    // return cfGabungan * 100;
  }

  num _hitungCfPositif(num cfLama, num cfBaru) {
    num result = cfLama + (cfBaru * (1 - cfLama));
    return result;
  }

  num _hitungCfNgeatif(num cfLama, num cfBaru) {
    num result = cfLama + (cfBaru * (1 + cfLama));
    return result;
  }

  num _hitungCfBeda(num cfLama, num cfBaru) {
    num result = cfLama + cfBaru / (1 - math.min(cfLama, cfBaru));
    return result;
  }
}
