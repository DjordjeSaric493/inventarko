import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:inventarko/screens/main_content_scr.dart';
import 'package:inventarko/utils/constants.dart';
import 'package:inventarko/widgets/appheader.dart';
import 'package:inventarko/widgets/verticalsidenavi_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  //declare variable 4 current index
  var currIndex = 0; //default value is 0
  @override
  Widget build(BuildContext context) {
    //TODO: odvali sebi šamarčinu kad se sjebeš da staviš currPage(), prosleđujem int ne fju bokte
    Widget buildMainContents({required int currPage}) {
      switch (currPage) {
        //depending on value blabla switch case expression,clASSic
        case 0:
          return MainContent();
        case 1:
          //!:
          return Container();
        case 2:
          return Container();
        case 3:
          return Container();
        case 4:
          return Container();
        default:
          return const MainContent();
      }
    }

    return Scaffold(
      //insteadof child, container is a body of our scaffold
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            //header
            const AppHeader(),
            //menu and content
            Expanded(
                child: Row(
              children: [
                //check vertnavimenu widget,I'll send parameters
                VerticalSideNaviMenu(
                  onTap: (int index) {
                    print(index); //print index of page idk
                    setState(() {
                      currIndex = index; //state to remember
                    });
                  },
                  currentIndex: currIndex,
                  //passing required params
                  //list of navbarmenuitems (icons)
                  menuItems: [
                    NavBarMenuItem(icon: Icons.home),
                    NavBarMenuItem(icon: Icons.shopping_cart),
                    NavBarMenuItem(icon: FontAwesomeIcons.tags),
                    NavBarMenuItem(icon: FontAwesomeIcons.objectGroup),
                    NavBarMenuItem(icon: Icons.store),
                  ],
                  //size of every icon is 22
                  iconSize: 22,
                ),
                //Main area
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultSpace + 2, top: defaultSpace + 2),

                      //here it will display main content/page
                      child: Text(
                        "Proizvodi",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.black38),
                      ),

                      /*Text("Products"): Displays the string "Products".
                                  Theme.of(context).textTheme.headlineLarge: Retrieves the default headlineLarge text style from the app's current theme.
                                  copyWith(color: Colors.black38): Modifies (or "copies") the existing headlineLarge style to change the text color to Colors.black38. */

                      //child is stf widget (stf= statefull not shut the f up)
                    ),
                    Expanded(child: buildMainContents(currPage: currIndex))
                  ],
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
