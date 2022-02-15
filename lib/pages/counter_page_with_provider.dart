import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_flutter/providers/counter_provider.dart';
import 'package:learning_flutter/providers/dummy_provider.dart';
import 'package:learning_flutter/providers/mesage_provider.dart';
import 'package:provider/provider.dart';

class CounterPage2 extends StatelessWidget {
  CounterPage2({Key? key}) : super(key: key);

  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController(text: "");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter With Provider"),
        ),
        body: _count2(context));
  }

  Widget _count2(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<MessageProvider>(
            builder: (context, messageProvider, child) => Column(
              children: [
                Text(
                  messageProvider.message,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(messageProvider.items.toString(), style: GoogleFonts.lato())
              ],
            )),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: context.read<CounterProvider>().decrement,
                child: const Text("Decrease")),
            const SizedBox(width: 16),
            ElevatedButton(
                onPressed: context.read<CounterProvider>().increment,
                child: const Text("Increase"))
          ],
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: 280.0,
          child: TextField(
              controller: _controller,
              maxLines: 1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "item..",
                  labelText: "Item"
              ),
              autofocus: true
          ),
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().increment();
              if (_controller.text.isNotEmpty) {
                context.read<DummyProvider>().addItem(_controller.text);
                _controller.text = "";
              }
              },
            child: const Text("Add Item")),
        const SizedBox(height: 8.0),
        ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().decrement();
              if (_controller.text.isNotEmpty) {
                context.read<DummyProvider>().removeItem(_controller.text);
                _controller.text = "";
              }
            },
            child: const Text("Remove Item"))
      ],
    );
  }

  Widget _count() {
    return Consumer<CounterProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${provider.count}',
              style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: provider.decrement,
                    child: const Text("Decrease")),
                const SizedBox(width: 16),
                ElevatedButton(
                    onPressed: provider.increment,
                    child: const Text("Increase"))
              ],
            )
          ],
        );
      },
    );
  }
}
