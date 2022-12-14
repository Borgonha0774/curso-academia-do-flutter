import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  /* Construtor privado */
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
        /* Podemos usar a biblioteca do google fonts do pub dev */
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryColor: const Color(0xff5c77ce),
        primaryColorLight: const Color(0xffabc8f7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5c77ce),
          ),
        ),
      );
}
