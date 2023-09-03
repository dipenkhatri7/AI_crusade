import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final String name;
  final String icon;
  bool isSelected = false;
  CategoryList({
    required this.name,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.grey : Colors.grey,
        ),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(icon),
            color: isSelected ? Colors.white : Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
