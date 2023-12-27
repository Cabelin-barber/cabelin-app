import 'package:cabelin_v2/firebase_options.dart';
import 'package:cabelin_v2/routes/main.dart';
import 'package:cabelin_v2/utils/globalContext.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          space: 35,
          color: Colors.grey.withOpacity(0.6)
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              )
            )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          suffixIconColor: const Color(0xFF272727).withOpacity(0.5),
          iconColor: const Color(0xFF272727).withOpacity(0.5),
          prefixIconColor: const Color(0xFF272727).withOpacity(0.5),
          contentPadding:const EdgeInsets.only(left: 16, top: 23, right: 16, bottom: 23),
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w300
          ),
          labelStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: const Color(0xFF272727).withOpacity(0.5)),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          enableFeedback: false,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: Color(0XFF322938),
          unselectedItemColor: Color(0XFF322938),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}