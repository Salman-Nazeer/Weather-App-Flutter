import 'package:flutter/material.dart';
import 'package:newproject/constants/colors.dart';
import 'package:newproject/viewscreens/dashboard_screen.dart';

class Navbar extends StatefulWidget {
  const new({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<Widget> myScreenList = [DashboardScreen()];

  int myScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreenList[myScreenIndex],

      backgroundColor: AppColors.backgroundLight,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myScreenIndex, // Syncs the active state indicator
        onTap: (index) {
          setState(() {
            myScreenIndex = index;
          });
        },
        backgroundColor: AppColors.white, // Using your AppColors.white
        selectedItemColor:
            AppColors.primaryBlue, // Using your AppColors.primaryBlue
        unselectedItemColor: AppColors.black54, // Using your AppColors.black54
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
