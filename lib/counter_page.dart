import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TAJBIH",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              _counter.toString(),
              style: TextStyle(color: Colors.white, fontSize: 185),
            ),
            Text(
              "Count",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _resetCounter();
                    },
                    child: Icon(
                      Icons.restore,
                      color: Colors.black,
                    )),
                ElevatedButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 50,
                    )),
                ElevatedButton(
                  onPressed: () {
                    _decrementCounter();
                  },
                  child: Icon(
                    Icons.remove,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
