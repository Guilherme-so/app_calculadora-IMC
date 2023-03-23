import 'package:flutter/material.dart';
import 'package:calculadora_imc/my_info.dart';
import 'package:calculadora_imc/button.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  late TextEditingController _pesoControler;
  late TextEditingController _alturaControler;

  double? imc;
  String? statusWeight;
  Color? statusColor;
  double _currentPesoSliderValue = 70;
  double _currentAlturaSliderValue = 1.7;

  @override
  void initState() {
    _pesoControler =
        TextEditingController(text: _currentPesoSliderValue.toString());
    _alturaControler =
        TextEditingController(text: _currentAlturaSliderValue.toString());
    super.initState();
  }

  @override
  void dispose() {
    _alturaControler.dispose();
    _pesoControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imc == null
                ? const Text(
                    'Preencha seu peso e sua altura \n para calcular seu IMC.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : MyInfo(
                    statusColor: statusColor,
                    imc: imc,
                    statusWeight: statusWeight,
                  ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text("Seu Peso"),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 75,
                            child: TextField(
                              enabled: false,
                              controller: _pesoControler,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixText: "kg",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const Text("Sua altura"),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 75,
                            child: TextField(
                              enabled: false,
                              controller: _alturaControler,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixText: "m",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          const Text('Peso'),
                          Slider(
                            value: _currentPesoSliderValue,
                            label: _currentPesoSliderValue.round().toString(),
                            activeColor: statusColor ?? Colors.deepOrange[400],
                            max: 200,
                            onChanged: (double value) {
                              setState(() {
                                _currentPesoSliderValue = value;
                                _pesoControler = TextEditingController(
                                    text: value.toStringAsFixed(0));
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Altura'),
                          Slider(
                            value: _currentAlturaSliderValue,
                            label: _currentAlturaSliderValue.round().toString(),
                            activeColor: statusColor ?? Colors.deepOrange[400],
                            min: 1,
                            max: 2.5,
                            onChanged: (double value) {
                              setState(() {
                                _currentAlturaSliderValue = value;
                                _alturaControler = TextEditingController(
                                    text: value.toStringAsFixed(2));
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Button(
              statusColor: statusColor,
              onPressed: () {
                try {
                  setState(() {
                    double peso = double.parse(_pesoControler.text);
                    double altura = double.parse(_alturaControler.text);

                    if (peso != 0 && altura != 0) {
                      imc = peso / (altura * altura);
                    } else {
                      imc = null;
                    }

                    getStatusWeight(imc);
                    getColorStatus(imc);
                  });
                } catch (err) {
                  setState(() {
                    _pesoControler.text = '';
                    _alturaControler.text = '';
                    imc = null;
                    statusColor = null;
                    statusWeight = null;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }

  getStatusWeight(double? imc) {
    imc! <= 18.5
        ? statusWeight = "Peso baixo"
        : imc <= 24.99
            ? statusWeight = "Peso Normal"
            : imc <= 29.99
                ? statusWeight = "Sobre Peso"
                : imc > 30
                    ? statusWeight = "Obesidade"
                    : statusWeight = 'Prencha Peso e altura valida';
  }

  getColorStatus(imc) {
    imc! < 18.5
        ? statusColor = Colors.red[300]
        : imc! < 24.99
            ? statusColor = Colors.green
            : imc! < 29.99
                ? statusColor = Colors.orangeAccent[400]
                : imc! > 30
                    ? statusColor = Colors.deepOrange
                    : statusColor = Colors.red[300];
  }
}
