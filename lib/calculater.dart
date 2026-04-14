import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        canvasColor: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      title: "Calculater",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculater"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: no1Controller,
              decoration: InputDecoration(
                  hintText: 'Enter no1',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),

            SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: no2Controller,
              decoration: InputDecoration(
                  hintText: 'Enter no2',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var sum = no1 + no2;

                      result = "$sum";
                      setState(() {});
                    },
                    child: Text('Add')),
                ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var sub = no1 - no2;

                      result = "$sub";
                      setState(() {});
                    },
                    child: Text('Sub')),
                ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var mul = no1 * no2;

                      result = "$mul";
                      setState(() {});
                    },
                    child: Text('Multiply')),
                ElevatedButton(
                    onPressed: () {
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var div = no1 / no2;

                      result = "${div.toStringAsFixed(2)}";
                      setState(() {});
                    },
                    child: Text('Div')),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurpleAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
