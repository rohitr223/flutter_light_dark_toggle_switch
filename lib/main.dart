import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // current index will be zero initially
  int currentIndex = 0;

  // set to the light mode initially
  bool isDarkMode = false;

  // switch to light mode
  switchToLightMode() {
    isDarkMode = false;
  }

  // switch to dark mode
  switchToDarkMode() {
    isDarkMode = true;
  }

  // switch modes according to the current index
  void toggleMode() {
    if (currentIndex == 0) {
      switchToDarkMode();
    } else {
      switchToLightMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // change the background color accordingly...
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        body: Center(
          child: ToggleSwitch(
            minWidth: 90.0,
            minHeight: 70.0,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            initialLabelIndex: currentIndex,
            icons: const [
              Icons.dark_mode,
              Icons.light_mode,
            ],
            iconSize: 30.0,
            activeBgColors: const [
              [Colors.blue, Colors.indigo],
              [Colors.yellow, Colors.orange],
            ],
            animate: true,
            curve: Curves.bounceInOut,
            onToggle: (index) {
              setState(() {
                // set the currentIndex according to the present index
                currentIndex = index!;
                // toggle the background color
                toggleMode();
              });
            },
          ),
        ),
      ),
    );
  }
}
