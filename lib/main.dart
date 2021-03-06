import 'package:flutter/material.dart';
import 'package:pc_buddy/computer_case.dart';
import 'package:pc_buddy/cooling.dart';
import 'package:pc_buddy/cpu.dart';
import 'package:pc_buddy/credits.dart';
import 'package:pc_buddy/displays.dart';
import 'package:pc_buddy/gpu.dart';
import 'package:pc_buddy/input_devices.dart';
import 'package:pc_buddy/introduction.dart';
import 'package:pc_buddy/motherboard.dart';
import 'package:pc_buddy/operating_systems.dart';
import 'package:pc_buddy/psu.dart';
import 'package:pc_buddy/ram.dart';
import 'package:pc_buddy/references.dart';
import 'package:pc_buddy/storage_devices.dart';

//TESTIONGA ACWOIJDALWUJHDLAUWHD

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PC Buddy",
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const Home());
  }
}

const navMenuOptions = [
  "Introduction",
  "Computer Case",
  "Motherboard",
  "CPU",
  "GPU",
  "RAM",
  "Storage Devices",
  "Cooling",
  "PSU",
  "Displays",
  "Operating Systems",
  "Input Devices",
  "References",
  "Credits",
];


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String appBarTitle = navMenuOptions[0];
  int selected = 0;
  double navScrollState = 0;
  ScrollController navScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    navScroll = ScrollController(initialScrollOffset: navScrollState);
    appBarTitle = navMenuOptions[selected];
    Widget currentPage = Container();
    switch (navMenuOptions[selected]) {
      case "Introduction":
        currentPage = IntroductionPage();
        break;
      case "Computer Case":
        currentPage = ComputerCasePage();
        break;
      case "Motherboard":
        currentPage = MotherboardPage();
        break;
      case "CPU":
        currentPage = CPUPage();
        break;
      case "GPU":
        currentPage = GPUPage();
        break;
      case "RAM":
        currentPage = RAMPage();
        break;
      case "Storage Devices":
        currentPage = StorageDevicesPage();
        break;
      case "Cooling":
        currentPage = CoolingPage();
        break;
      case "PSU":
        currentPage = PSUPage();
        break;
      case "Displays":
        currentPage = DisplaysPage();
        break;
      case "Operating Systems":
        currentPage = OperatingSystemsPage();
        break;
      case "Input Devices":
        currentPage = InputDevicesPage();
        break;
      case "References":
        currentPage = ReferencesPage();
        break;
      case "Credits":
        currentPage = CreditsPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle), backgroundColor: Colors.purple),
      drawer: Drawer(
        backgroundColor: Color(0xff0d0029),
        child: ListView(controller: navScroll,children: navMenu(),),
      ),
      backgroundColor: Color(0xff0d0029),
      body: currentPage,
    );
  }

  List<Widget> navMenu() {
    List<Widget> menu = [
      SizedBox(
          height: 75.0,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text(
              "Main Menu",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ))
    ];
    for (int i = 0; i < navMenuOptions.length; i++) {
      menu.add(ListTile(
        tileColor: selected == i ? Colors.deepPurple : Colors.transparent,
        title: Text(
          navMenuOptions[i],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          if (selected != i) {
            setState(() {
              navScrollState = navScroll.offset;
              selected = i;
            });
          }
        },
      ));
    }
    return menu;
  }
}