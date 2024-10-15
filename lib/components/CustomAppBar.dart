/*
 * Archivo: custom_app_bar.dart
 * Propósito: Implementar una barra de navegación personalizada (AppBar) con opciones para alternar el tema de la aplicación (modo claro/oscuro) 
 *            y cambiar entre Material Design 2 y 3.
 * Autor: Walter Stefano
 * Fecha de modificación: 15 de octubre de 2024
 */

import 'package:flutter/material.dart';
import 'package:calc_upeux/theme/AppTheme.dart';

/// `CustomAppBar` es una barra de navegación personalizada que permite alternar el tema (modo claro/oscuro) y cambiar
/// entre Material Design 2 y Material Design 3.
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// Función de callback que se ejecuta cuando se realizan cambios en el tema.
  final Function accionx;

  /// Establece el tamaño preferido de la AppBar.
  @override
  final Size preferredSize;

  /// Constructor de `CustomAppBar`.
  /// Recibe la función [accionx] para ejecutar al cambiar el tema.
  CustomAppBar({super.key, required this.accionx})
      : preferredSize = const Size.fromHeight(
            50.0); // La altura de la AppBar es de 50 píxeles.

  /// Crea el estado asociado al widget `CustomAppBar`.
  @override
  _CustomAppBarState createState() => _CustomAppBarState(accionx);
}

/// Estado de `CustomAppBar` que contiene la lógica de los botones de cambio de tema y diseño.
class _CustomAppBarState extends State<CustomAppBar> {
  /// Función de callback para actualizar el tema y otros ajustes.
  final Function accionx;

  /// Constructor que inicializa el estado con la función [accionx].
  _CustomAppBarState(this.accionx);

  /// Construye la interfaz de la AppBar.
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Título centrado que muestra "Material 2" o "Material 3" según la configuración actual.
      title: Center(
        child: AppTheme.useMaterial3
            ? const Text("Material 3")
            : const Text("Material 2"),
      ),

      // Conjunto de botones de acción en la AppBar.
      actions: [
        // Botón para alternar entre modo claro y modo oscuro.
        IconButton(
          icon: AppTheme.useLightMode
              ? const Icon(Icons.wb_sunny_outlined) // Icono para el modo claro.
              : const Icon(Icons.wb_sunny), // Icono para el modo oscuro.
          onPressed: () {
            setState(() {
              // Cambia el estado de `useLightMode` y actualiza el tema global.
              AppTheme.useLightMode = !AppTheme.useLightMode;
              AppTheme.themeData = ThemeData(
                colorSchemeSeed: AppTheme.colorOptions[AppTheme
                    .colorSelected], // Color base del esquema de colores.
                useMaterial3: AppTheme
                    .useMaterial3, // Mantiene el uso de Material Design 3.
                brightness: AppTheme.useLightMode
                    ? Brightness.light // Aplica modo claro.
                    : Brightness.dark, // Aplica modo oscuro.
              );
              accionx(); // Llama a la función de callback para actualizar la aplicación.
            });
          },
          tooltip:
              "Toggle brightness", // Texto que aparece al mantener presionado el botón.
        ),

        // Botón para alternar entre Material Design 2 y Material Design 3.
        IconButton(
          icon: AppTheme.useMaterial3
              ? const Icon(Icons.filter_3) // Icono para Material Design 3.
              : const Icon(Icons.filter_2), // Icono para Material Design 2.
          onPressed: () {
            setState(() {
              // Cambia el estado de `useMaterial3` y actualiza el tema global.
              AppTheme.useMaterial3 = !AppTheme.useMaterial3;
              AppTheme.themeData = ThemeData(
                colorSchemeSeed: AppTheme.colorOptions[AppTheme
                    .colorSelected], // Color base del esquema de colores.
                useMaterial3: AppTheme
                    .useMaterial3, // Cambia entre Material Design 2 y 3.
                brightness: AppTheme.useLightMode
                    ? Brightness.light // Aplica modo claro si está activado.
                    : Brightness.dark, // Aplica modo oscuro si está activado.
              );
              accionx(); // Llama a la función de callback para actualizar la aplicación.
            });
          },
          tooltip:
              "Switch to Material ${AppTheme.useMaterial3 ? 2 : 3}", // Texto informativo sobre el cambio de diseño.
        ),
      ],
    );
  }
}
