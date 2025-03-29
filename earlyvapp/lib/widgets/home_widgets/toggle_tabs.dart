import 'package:flutter/material.dart';

class ToggleTabs extends StatefulWidget {
  final Function(int) onTabChanged;

  ToggleTabs({required this.onTabChanged});

  @override
  _ToggleTabsState createState() => _ToggleTabsState(); 
}

class _ToggleTabsState extends State<ToggleTabs> {
  int _activeTabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _activeTabIndex = index;
    });
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 12, 83, 17),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab('Main', 0),
          _buildTab('Register', 1),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    bool isActive = _activeTabIndex == index;
    return GestureDetector(
      onTap: () => _selectTab(index),
      child: Container(
        width: 122,
        height: 30,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              )
            : null,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Color.fromARGB(255, 12, 83, 17) : Colors.white,
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w400 : FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
