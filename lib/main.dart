import 'package:flutter/material.dart';
import 'bmi_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nititorn Donsay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage (title: 'BMI',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Padding(
                padding: EdgeInsets.all(16),
                ),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 255, 234),
                  elevation: 0, // Shadow scale
                ),
                child: const Text('กดเพื่อไปหน้าคำนวณ BMI'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormHealthInfoPage(
                                
                                )));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}