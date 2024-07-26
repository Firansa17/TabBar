import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.animateTo(index); // Mengganti tab yang sedang aktif
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Daftar Elektronik"),
        bottom: TabBar(
          controller: controller,
          isScrollable: true, // Menambahkan ini untuk bisa di-swipe kanan dan kiri
          tabs: <Tab>[
            Tab(icon: Icon(Icons.computer), text: "Komputer"),
            Tab(icon: Icon(Icons.headset), text: "Headset"),
            Tab(icon: Icon(Icons.laptop), text: "Laptop"),
            Tab(icon: Icon(Icons.smartphone), text: "Smartphone"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.computer, size: 100, color: Colors.red),
                SizedBox(height: 20),
                Text("Komputer Tab"),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.headset, size: 100, color: Colors.green),
                SizedBox(height: 20),
                Text("Headset Tab"),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.laptop, size: 100, color: Colors.blue),
                SizedBox(height: 20),
                Text("Laptop Tab"),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.smartphone, size: 100, color: Colors.purple),
                SizedBox(height: 20),
                Text("Smartphone Tab"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Komputer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.headset),
            label: 'Headset',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            label: 'Laptop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smartphone),
            label: 'Smartphone',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
