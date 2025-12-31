import 'package:flutter/material.dart';

void main() {
  runApp(const SumItUpApp());
}

class SumItUpApp extends StatelessWidget {
  const SumItUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sum It Up',
      home: const SumHomePage(),
    );
  }
}

class SumHomePage extends StatefulWidget {
  const SumHomePage({super.key});

  @override
  State<SumHomePage> createState() => _SumHomePageState();
}

class _SumHomePageState extends State<SumHomePage> {
  final TextEditingController _numbersController = TextEditingController();
  int _sum = 0;

  void _calculateSum() {
    final input = _numbersController.text.trim();

    if (input.isEmpty) {
      setState(() {
        _sum = 0;
      });
      return;
    }

    final numbers = input
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0)
        .toList();

    setState(() {
      _sum = numbers.reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum It Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter numbers separated by commas',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _numbersController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 10, 20, 30',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text('Calculate Sum'),
            ),
            const SizedBox(height: 30),
            Text(
              '✨ The sum of the entered numbers is: $_sum',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
