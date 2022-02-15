import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  var count = 0;

  // Private Increment Function
  // To increase the value of counter by 1
  void _increment() {
    setState(() {
      count++;
    });
  }

  // Private Decrement Function
  // To decrease the value of counter by 1
  void _decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$count',
            style: const TextStyle(
                fontSize: 100, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _decrement, child: const Text("Decrease")),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: _increment, child: const Text("Increase"))
            ],
          )
        ],
      )
    );
  }
}
