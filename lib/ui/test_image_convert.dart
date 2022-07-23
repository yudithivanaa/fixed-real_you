import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'home_view.dart';

class testImageConvert extends StatefulWidget {
  final List<String> listimagepath;

  const testImageConvert({Key key, this.listimagepath}) : super(key: key);

  @override
  _testImageConvertState createState() => _testImageConvertState();
}
abstract class Quoter {
  String getQuote(int index);
}
class AngryQuotes extends Quoter {
  var quotes = {0: "don't be mad just by such a thing, no need to ruin your days",
    1: "it's okay if you don't have such a good day, don't keep keep it till sun goes die",
    2: "yuk luapkan emosi mu pada hal yang positif",
    3: "gapapa kok kalau kamu marah, ga semua hal harus diberi sabar",
    4: "kalau emosi mu sedang menumpuk, jangan menyakiti diri sendiri ya"};

  @override
  String getQuote(int index) {
    return quotes[index];
  }
}

class DisgustQuotes extends Quoter {
  var quotes = {0: "ini memang hidupmu, wajar jika merasa muak, jangan lupa kalau kamu tidak sendiri ya",
    1: "don't let that thing's around you anymore!",
    2: "tidakkah menakutkan untuk bosan pada keseharian, lalu menjadikan internet pelarian? Saat membuka situs pertemanan, orang-orang berlomba diperhatikan. Kau pun muak memperhatikan dan mencoba mencari perhatian",
    3 : "jangan hiraukan hal yang membuatmu merasa tidak nyaman!",
    4 : "sudah pasti akan ada hal seperti ini, ayo menyingkir dari hal menjijikkan"};

  @override
  String getQuote(int index) => quotes[index];
}

class FearQuotes extends Quoter {
  var quotes = {0: "orang pemberani bukanlah dia yang tidak merasa takut, tapi dia yang mengalahkan rasa takut itu",
    1: "don't let your fear make you such a loser",
    2: "Satu di antara penemuan terbesar yang dibuat seseorang, salah satu kejutan besarnya, adalah menemukan dia bisa melakukan apa yang dia khawatir tidak bisa dia lakukan",
    3: "menjadi takut untuk beberapa saat memang hal yang wajar, tarik nafas dalam-dalam, kamu bisa melewati ini!",
    4: "jadikan takut sebagai temanmu, supaya kamu bisa melewati hari hari bersamanya yang tidka mengganggu mu lagi"};

  @override
  String getQuote(int index) => quotes[index];
}

class HappyQuotes extends Quoter {
  var quotes = {0: "happy is just a bunch of trigger to make your day!",
    1: "bahagia itu sederhana, sesederhana melihat orang yang kita sayangi bahagia",
    2: "bukan dia yang hebat dalam segalanya, namun dia yang mampu temukan hal sederhana dalam hidupnya dan tetap bersyukur",
    3: "i know you can do it! selamat menjalani aktivitas hariini!",
    4: "kalau kamu sedang bahagia, jangan lupa sebarkan energi bahagia itu kepada sekitarmu yaa"};

  @override
  String getQuote(int index) => quotes[index];
}

class SadQuotes extends Quoter {
  var quotes = {0: "orang menangis bukan karena mereka lemah. Tapi, mereka menangis karena telah berusaha kuat dalam waktu yang lama",
    1: "air mata yang menetes untuk orang lain bukanlah pertanda kelemahan. Itu adalah tanda hati yang murni",
    2: "peluk jauh untukmu yang sedang bersedih, aku tau ini tidaklah mudah, tapi berusahalah yaa",
    3: "berharap dapat mendekapmu se-erat mungkin, kamu bisa menelwati ini, semangat",
    4: "terkadang memang kita harus membiarkan sesuatu menyakiti kita untuk membuat kulit kita lebih tebal"};

  @override
  String getQuote(int index) => quotes[index];
}

class SurpriseQuotes extends Quoter {
  var quotes = {0: "jika kita melakukan semua hal yang kita mampu lakukan, kita telah sungguh-sungguh membuat diri kita terkejut",
    1: "tidak perlu terlalu kaget, perubahan ini hal yang biasa terjadi",
    2: "kenapa kamu terkejut? boleh ceritakan padaku nanti?",
    3: "aku juga terkejut saat tau kamu terkejut, tenang yaa, mari kendlaikan dirimu",
    4: "kadangpun terkejutlah akar dari segala hal hal paling menarik dan paling tidak menarik"};

  @override
  String getQuote(int index) => quotes[index];
}
class _testImageConvertState extends State<testImageConvert> {

  List<String> imagePath;
  String Quotes;
  bool _loading = false;
  List<dynamic> _outputs ;
  Map<int, dynamic> outputmap = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    imagePath = widget.listimagepath;
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });

    log("PATH ${imagePath[0]}");
    classifyImage(imagePath[0], 0);

  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_exp(2).tflite",
      labels: "assets/labels_exp.txt",
    );
  }

  classifyImage(String imagePath, int index) async {
    var output = await Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2,
      threshold: 0.5,
      imageMean: 125.0,
      imageStd: 125.0,
    );
    setState(() {
      _loading = false;
      _outputs = output;
      log(_outputs[0]["label"]);
      // log(_outputs.toString());
      log("INI OUTPUT $index ${_outputs[0].toString()}");
      log("INI INDEX $index ${_outputs[0]["index"]}");

      var r = new math.Random(DateTime.now().microsecondsSinceEpoch);
      var inferenceResult = _outputs[0]["index"];
      switch (inferenceResult) {
        case 0:
          {
            var selectedQuotes = AngryQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
        case 1:
          {
            var selectedQuotes = DisgustQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
        case 2:
          {
            var selectedQuotes = FearQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
        case 3:
          {
            var selectedQuotes = HappyQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
        case 4:
          {
            var selectedQuotes = SadQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
        case 5:
          {
            var selectedQuotes = SurpriseQuotes();
            var index = r.nextInt(5);
            log("${selectedQuotes.getQuote(index)}");
            Quotes=selectedQuotes.getQuote(index);
            break;
          }
      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Real_you")
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            // backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeView()));
              body: Center(
                  child: Container(
                      width: 600,
                      alignment: Alignment.center,
                      child: Text('${Quotes}', style: TextStyle (fontStyle: FontStyle.italic, fontSize: 150, color: Colors.white, backgroundColor: Colors.black))
                  )
              );
            }
        )
    );
  } }
