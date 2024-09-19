import 'package:flutter/material.dart';
import 'package:inventarko/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventarko by Sarić',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

//press stf for stateful or stl for stateless widget
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //insteadof child, container is a body of our scaffold
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            //header
            AppHeader(), //widget I'm gonna make

            Expanded(
                child: Row(
              children: [
                VerticalSideNaviMenu(), //another widget I'm gonna make
                Expanded(
                    child: Column(
                  children: [],
                )),
              ],
            ))
            //side navigation
          ],
        ),
      ),
    );
  }
}
