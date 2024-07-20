// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class FormHealthInfoPage extends StatefulWidget {
  FormHealthInfoPage({Key? key}) : super(key: key);

 

  @override
  State<FormHealthInfoPage> createState() => _FormHealthInfoPageState();
}

Future<void> saveData(String key, String value) async {
  var SharedPreferences;
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

class _FormHealthInfoPageState extends State<FormHealthInfoPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _weightStatus = '';

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);

    if (height > 0 && weight > 0) {
      double bmi = weight / (height * height);

      String weightStatus = getWeightStatus(bmi);
      setState(() {
        _bmiResult = bmi;

        _weightStatus = weightStatus;
      });
    }
  }
String getWeightStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Healthy weight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else if (bmi >= 30 && bmi <= 34.9) {
      return "Obesity class I";
    } else if (bmi >= 35 && bmi <= 39.9) {
      return "Obesity class II";
    } else {
      return "Obesity class III";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำนวณ BMI'),
      ),



       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ส่วนสูง (เมตร)',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                   controller: _heightController,

                  ),
            ),
            Text(
              'น้ำหนัก (กิโลกรัม)',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 32.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                    controller: _weightController,

                  ),
            ),



            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('คำนวณ'),
            ),
            SizedBox(height: 30),
            Text(
              'BMI: ${_bmiResult.toStringAsFixed(2)}',
               style: const TextStyle(fontSize: 40, color: Colors.deepOrange),
            ),
            Text(
              'สถานะ: ${_weightStatus}',
              style: const TextStyle(fontSize: 40, color: Colors.deepOrange),
            ),

          ],
        ),
      ),
    );
  }
}