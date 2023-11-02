import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var WtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var bgColor = Colors.indigo.shade200;
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Text('BMI',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurpleAccent,
                        fontSize: 50)),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  controller: WtController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your weight (in Kg)',
                    prefixIcon: Icon(
                      Icons.line_weight_sharp,
                      color: Colors.deepPurpleAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                  cursorColor: Colors.deepPurpleAccent,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your weight (in feet)',
                    prefixIcon: Icon(
                      Icons.height_rounded,
                      color: Colors.deepPurpleAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                  cursorColor: Colors.deepPurpleAccent,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your weight (in inch)',
                    prefixIcon: Icon(
                      Icons.height_outlined,
                      color: Colors.deepPurpleAccent,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                  cursorColor: Colors.deepPurpleAccent,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = WtController.text.toString();
                    var inch = inchController.text.toString();
                    var ft = ftController.text.toString();
                    if (wt!= '' && inch!= '' && ft!= '') {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);
                      var tInch = (ift * 12) + iinch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iwt / (tM * tM);
                      var msg = '';
                      if (bmi > 25) {
                        msg = "you're OverWeight!!";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "you're UnderWeight!!";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You're Healthy!!";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result = '$msg Your BMI is: ${bmi.toStringAsFixed(2)}';
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the require information blanks!!";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  child: const Text('Submit')),
              Text(
                result,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
