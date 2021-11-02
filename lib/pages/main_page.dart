import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedPage = index);
          },
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
            ),
            Container(
              color: Colors.redAccent,
            ),
            Container(
              color: Colors.green,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedPage,
        onItemSelected: (index) {
          setState(() => _selectedPage = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Dashboard'), icon: Icon(Icons.dashboard)),
          BottomNavyBarItem(title: Text('Date'), icon: Icon(Icons.date_range)),
          BottomNavyBarItem(title: Text('Time'), icon: Icon(Icons.timer)),
        ],
      ),
    );
  }
}
