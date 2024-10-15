/*
 * Archivo: calc_button.dart
 * Propósito: Definir un botón reutilizable para la calculadora en Flutter, que acepta texto, colores y tamaños personalizados.
 * Autor: Walter Stefano
 * Fecha de modificación: 15 de octubre de 2024
 */
import 'package:flutter/material.dart';

/// `CalcButton` es un botón reutilizable para una calculadora.
/// Este botón acepta un texto, colores de fondo y texto personalizados,
/// y ejecuta una función cuando se presiona.
class CalcButton extends StatelessWidget {
  /// Texto que se mostrará en el botón.
  final String? text;

  /// Color de fondo del botón. Por defecto, es un color naranja claro.
  final int fillColor;

  /// Color del texto en el botón. Por defecto, es un tono gris.
  final int textColor;

  /// Tamaño de la fuente del texto en el botón. Por defecto, es 20.
  final double textSize;

  /// Función de callback que se ejecuta cuando se presiona el botón.
  final Function? callback;

  /// Constructor del botón `CalcButton`.
  /// Se inicializan las propiedades `text`, `fillColor`, `textColor`, `textSize` y `callback`.
  const CalcButton({
    Key? key, // Se utiliza el super key para identificar este widget.
    this.text, // Texto que aparecerá en el botón.
    this.fillColor = 0xFFFFB74D, // Color de fondo predeterminado.
    this.textColor = 0xFF6C807F, // Color de texto predeterminado.
    this.textSize = 20, // Tamaño de la fuente predeterminado.
    this.callback, // Callback que se ejecutará cuando se presione el botón.
  }) : super(key: key);

  /// Método que construye la interfaz del botón.
  /// Retorna un botón elevado con el estilo y funcionalidades personalizadas.
  @override
  Widget build(BuildContext context) {
    return Container(
      // Margen alrededor del botón para darle espacio.
      margin: const EdgeInsets.all(5),

      // El botón tiene un tamaño fijo de 70x70 píxeles.
      child: SizedBox(
        width: 70,
        height: 70,

        // El botón es de tipo `ElevatedButton` con colores y forma personalizada.
        child: ElevatedButton(
          // Estilo del botón, incluyendo el color de fondo y el borde redondeado.
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(fillColor), // Asigna el color de fondo.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10), // Borde redondeado con radio de 10.
            ),
          ),

          // Definir lo que sucede al presionar el botón.
          onPressed: () {
            // Si el callback no es nulo, se ejecuta la función.
            if (callback != null) {
              callback!(text); // Pasa el texto del botón al callback.
            }
          },

          // El texto que aparece en el botón, estilizado con el color y tamaño definidos.
          child: Text(
            text!, // El texto es obligatorio y no debe ser nulo.
            style: TextStyle(
              color: Color(textColor), // Asigna el color del texto.
              fontSize: textSize, // Asigna el tamaño del texto.
              fontWeight: FontWeight.bold, // Hace el texto en negrita.
            ),
          ),
        ),
      ),
    );
  }
}
