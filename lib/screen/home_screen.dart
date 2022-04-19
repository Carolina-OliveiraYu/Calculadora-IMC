import 'package:calculadora_imc/utils/calculo_imc.dart';
import 'package:calculadora_imc/utils/double_filter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  final GlobalKey<FormState> _formatoKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus dados';

  void _resetFields() {
    _pesoController.text = '';
    _alturaController.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void _calculate() {
    setState(() {
      double altura = DoubleFilter.formatDouble(_alturaController.text) / 100;
      double peso = DoubleFilter.formatDouble(_pesoController.text) / 10;
      double imc = peso / (altura * altura);
      _infoText = CalculoImc.resultadoImc(imc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora de IMC",
          style: TextStyle(
            fontSize: 25.0,
            color: Color.fromARGB(255, 255, 244, 253),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 0, 54),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 244, 253),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formatoKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.calculator,
                    size: 119.0, color: Color.fromARGB(255, 63, 0, 54)),
              ),
              TextFormField(
                maxLength: 5,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'ex: 50.0',
                    labelText: 'Peso (Kg)',
                    labelStyle: TextStyle(color: Colors.black87)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal),
                controller: _pesoController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu Peso';
                  }
                  return null;
                },
              ),
              TextFormField(
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'ex: 1.50',
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 63, 0, 54),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 63, 0, 54),
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal),
                  controller: _alturaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe sua Altura';
                    } else if (value.length < 4) {
                      return 'Altura informada é invalida';
                    }
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  color: const Color.fromARGB(255, 63, 0, 54),
                  child: TextButton(
                    onPressed: () {
                      if (_formatoKey.currentState!.validate()) {
                        _calculate();
                      }
                    },
                    child: const Text(
                      'Calcular',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 244, 253),
                          fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color:
                        const Color.fromARGB(255, 63, 0, 54).withOpacity(0.6),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
