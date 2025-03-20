// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorPessoas(),
    );
  }
}

class ContadorPessoas extends StatefulWidget {
  const ContadorPessoas({super.key});

  @override
  _ContadorPessoasState createState() => _ContadorPessoasState();
}

class _ContadorPessoasState extends State<ContadorPessoas> {
  int _contador = 0;
  Color _corDeFundo = Colors.white;
  final int _limiteMaximo = 25;

  void _incrementar() {
    setState(() {
      if (_contador < _limiteMaximo) {
        _contador++;
      }
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) {
        _contador--;
      }
    });
  }

  void _alterarCorDeFundo() {
    setState(() {
      _corDeFundo = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _corDeFundo,
      appBar: AppBar(
        title: const Text("Contador de Pessoas"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Pessoas no ambiente:",
            style: TextStyle(fontSize: 22),
          ),
          Text(
            "$_contador",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          if (_contador >= _limiteMaximo)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Limite máximo atingido!",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _incrementar,
                child: const Text("Entrar"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrementar,
                child: const Text("Sair"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _alterarCorDeFundo,
            child: const Text("Mudar Cor de Fundo"),
          ),
        ],
      ),
    );
  }
}