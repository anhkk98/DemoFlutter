import 'package:flutter/material.dart';
import 'package:hello_word/phanloaixe/Oto.dart';
import 'package:hello_word/phanloaixe/Xemay.dart';

class BottomNavigatorLoaixe extends StatefulWidget {
  @override
  _BottomNavigatorLoaixeApp createState() => new _BottomNavigatorLoaixeApp();
}
class _BottomNavigatorLoaixeApp extends State<BottomNavigatorLoaixe> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    Xemay(), Oto()
  ];
  int _selectedIndex = 0;
  void _onPageChaned(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _itemTapper(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChaned,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(onTap: _itemTapper, items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_bike,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),

            title: Text(
              "Xe gắn máy",
              style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            title: Text(
              "Ô tô",
              style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            )),
      ]),
    );
  }
}