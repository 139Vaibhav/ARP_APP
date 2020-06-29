import 'package:archi_app/screens/grade-check-screen.dart';
import 'package:archi_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page':CategoriesScreen(), 'title': 'ARCHI'},
    {'page' :GradeCheckScreen(), 'title': 'GradeCheck'},
  ];

  int _selectedPageIndex =0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),  
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.category),
              title: Text('Semesters'),
              ),
            BottomNavigationBarItem(
              icon:Icon(Icons.star),
              title: Text('Favourites'),
              ),  
          ]
        ),
      );
  }
}