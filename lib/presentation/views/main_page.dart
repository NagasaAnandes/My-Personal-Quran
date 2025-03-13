import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/main_viewmodel.dart';
import '../widgets/bottom_navbar.dart';
// import 'home_page.dart';
import 'quran_page.dart'; // Tambahkan halaman Quran

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      body: IndexedStack(
        index: viewModel.selectedIndex,
        children: [
          Center(child: Text("Page 1")), // Index 0
          Center(child: Text("Page 2")), // Placeholder untuk Shalat
          Center(child: Text("Page 3")), // Placeholder untuk Calendar
          QuranPage(), // Index 3 (Quran)
          Center(child: Text("Page 5")), // Placeholder untuk Profile
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: viewModel.selectedIndex,
        onItemTapped: (index) => viewModel.setIndex(index),
      ),
    );
  }
}
