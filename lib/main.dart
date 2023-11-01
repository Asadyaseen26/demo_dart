import 'package:demo_dart/demo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  runApp( 
      const MyApp(),
    );
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         
      title: 'Car Rental System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      //   routes: {
      //     '/': (context) => DashboardScreen(),
      //     '/cart': (context) => CartScreen(),
      //   },
      home:  SafeArea(child:
     // LoginPages()
      // FileListPage()
      //MyPiechart()
      //LoginPage()
      // FunkyLoginPage()
  LocationPage()
          //DashboardPage()

          ),
    );
  }
}
