import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Viteză Medie',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SpeedCalculatorPage(),
    );
  }
}

class SpeedCalculatorPage extends StatefulWidget {
  const SpeedCalculatorPage({super.key});

  @override
  State<SpeedCalculatorPage> createState() => _SpeedCalculatorPageState();
}

class _SpeedCalculatorPageState extends State<SpeedCalculatorPage> {
  final TextEditingController dController = TextEditingController();
  final TextEditingController tController = TextEditingController();

  double? vMed;

  void calculeazaVitezaMedie() {
    final double? d = double.tryParse(dController.text);
    final double? t = double.tryParse(tController.text);

    if (d != null && t != null && t > 0 && d >0) {
      setState(() {
        vMed = d/t;
      });
    } else {
      setState(() {
        vMed = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Viteză Medie")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Distanța (km)"),
            ),
            TextField(
              controller: tController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Timpul (h)"),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculeazaVitezaMedie,
              child: const Text("Calculează viteza medie"),
            ),
            const SizedBox(height: 20),
            if (vMed != null)
              Text(
                "Viteza medie: ${vMed!.toStringAsFixed(2)} km/h",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            else
              const Text(
                "Introduceți toate valorile corecte",
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
