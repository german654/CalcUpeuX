/*
 * Archivo: main.dart
 * Propósito: Implementación de una calculadora básica usando Flutter.
 * Autor: Walter Stefano
 * Fecha de modificación: 15/10/2024
 */

import 'package:flutter/material.dart';
import 'package:calc_upeux/components/CustomAppBar.dart';
import 'package:calc_upeux/theme/AppTheme.dart';
import 'package:calc_upeux/components/CalcButton.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String valorAnt = ''; // Variable para almacenar el valor anterior ingresado
  String operador = ''; // Variable para almacenar el operador seleccionado
  TextEditingController _controller =
      TextEditingController(); // Controlador para gestionar la entrada del usuario

  // Función que maneja los clicks de los números
  void numClick(String text) {
    setState(() => _controller.text += text);
  }

  // Función que limpia la pantalla
  void clear(String text) {
    setState(() {
      _controller.text = '';
    });
  }

  // Función que maneja la selección de un operador
  void opeClick(String text) {
    setState(() {
      valorAnt =
          _controller.text; // Guarda el valor ingresado antes del operador
      operador = text; // Guarda el operador seleccionado
      _controller.text =
          ''; // Limpia el campo de entrada para el siguiente número
    });
  }

  // Función que calcula el resultado según el operador
  void resultOperacion(String text) {
    setState(() {
      switch (operador) {
        case "/":
          _controller.text =
              (int.parse(valorAnt) / int.parse(_controller.text)).toString();
          break;
        case "*":
          _controller.text =
              (int.parse(valorAnt) * int.parse(_controller.text)).toString();
          break;
        case "+":
          _controller.text =
              (int.parse(valorAnt) + int.parse(_controller.text)).toString();
          break;
        case "-":
          _controller.text =
              (int.parse(valorAnt) - int.parse(_controller.text)).toString();
          break;
        case "%":
          _controller.text =
              (int.parse(valorAnt) % int.parse(_controller.text)).toString();
          break;
      }
    });
  }

  // Función adicional para manejar acciones futuras
  void accion() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Lista de funciones correspondientes a cada botón
    List<List> funx = [
      [
        clear,
        clear,
        opeClick,
        opeClick
      ], // Primera fila: funciones de limpiar y operadores
      [
        numClick,
        numClick,
        numClick,
        opeClick
      ], // Segunda fila: clics de números y operadores
      [
        numClick,
        numClick,
        numClick,
        opeClick
      ], // Tercera fila: clics de números y operadores
      [
        numClick,
        numClick,
        numClick,
        opeClick
      ], // Cuarta fila: clics de números y operadores
      [
        numClick,
        numClick,
        numClick,
        resultOperacion
      ] // Quinta fila: clics de números y resultado
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeData,
      home: Scaffold(
        appBar: CustomAppBar(accionx: accion), // Barra de app personalizada
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  textAlign: TextAlign.end,
                  controller: _controller,
                  readOnly: true,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                labelList.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      labelList[index].length,
                      (indexx) => CalcButton(
                        text: labelList[index][indexx],
                        callback: funx[index][indexx]
                            as Function, // Asigna la función correcta a cada botón
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Lista de etiquetas para los botones de la calculadora
List<List> labelList = [
  ["AC", "C", "%", "/"], // Primera fila de etiquetas
  ["7", "8", "9", "*"], // Segunda fila de etiquetas
  ["4", "5", "6", "-"], // Tercera fila de etiquetas
  ["1", "2", "3", "+"], // Cuarta fila de etiquetas
  [".", "0", "00", "="] // Quinta fila de etiquetas
];
