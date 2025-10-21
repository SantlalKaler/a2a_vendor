import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color get primaryColor => const Color(0xFF076CA3);

Color get primaryColorDark => const Color(0xFF0c3c8c);

Color get primaryColorLight => Colors.red.shade200;

Color get scaffoldBackgroundColor => Colors.blueGrey.shade50;

Color get greenColor => const Color(0xFF25D366);

Color get disabledColor => Colors.grey.shade400;

MaterialColor get primaryColor1 => MaterialColor(0xFF0c3c8c, color);

Map<int, Color> color = {
  50: const Color(0xFF0c3c8c),
  100: const Color(0xFF0c3c8c),
  200: const Color(0xFF0c3c8c),
  300: const Color(0xFF0c3c8c),
  400: const Color(0xFF0c3c8c),
  500: const Color(0xFF0c3c8c),
  600: const Color(0xFF0c3c8c),
  700: const Color(0xFF0c3c8c),
  800: const Color(0xFF0c3c8c),
  900: const Color(0xFF0c3c8c),
};

class LightTheme {
  static getTheme() {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primarySwatch: primaryColor1,
      scaffoldBackgroundColor: Colors.blueGrey.shade50,
      primaryColor: primaryColor1.shade800,
      primaryColorDark: primaryColor1.shade900,
      primaryColorLight: primaryColor1.shade300,
      primaryIconTheme: IconThemeData(color: primaryColor1.shade700),
      iconTheme: const IconThemeData(color: Colors.black87),
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor1.shade900,
          iconTheme: IconThemeData(color: Colors.blueGrey.shade50)),
      cardColor: Colors.grey.shade50,
      cardTheme: CardThemeData(
          color: Colors.grey.shade50,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      chipTheme: ChipThemeData(
          selectedColor: primaryColor1.shade800,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          backgroundColor: Colors.blueGrey.shade100,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      textTheme: TextTheme(
          labelMedium: GoogleFonts.oswald(
              fontSize: 14, color: const Color(0xFF725B2E), letterSpacing: 1),
          labelSmall: GoogleFonts.oswald(
              fontSize: 14, color: Colors.black87, letterSpacing: 1),
          bodyLarge:
              GoogleFonts.lato(color: Colors.grey.shade600, fontSize: 14),
          bodyMedium:
              GoogleFonts.roboto(color: Colors.blueGrey.shade600, fontSize: 14),
          bodySmall: GoogleFonts.poppins(
              color: Colors.blueGrey.shade500, fontSize: 11),
          titleLarge: GoogleFonts.lato(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
          titleSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black87),
          titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black87, height: 1.0)),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.red.shade50,
            minimumSize: const Size(double.infinity, 40),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            side: BorderSide(
              color: primaryColor1,
            )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return primaryColor1; // Color when the button is pressed
                }
                if (states.contains(WidgetState.disabled)) {
                  return Colors.grey.shade400;
                }
                return Theme.of(Get.context!).primaryColor; // Default color
              }),
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
              minimumSize:
                  const MaterialStatePropertyAll(Size(double.infinity, 40)))),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor1.shade700,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        labelStyle:
            GoogleFonts.roboto(color: Colors.grey.shade600, fontSize: 13),
        hintStyle: GoogleFonts.lato(fontSize: 13),
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor1.shade600),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.grey.shade100;
        }),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.blueGrey.shade50),
      dialogTheme: DialogThemeData(
          contentTextStyle:
              GoogleFonts.poppins(color: Colors.grey.shade700, fontSize: 13),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w600, fontSize: 14.5, color: Colors.black87),
        iconColor: Colors.black87,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
