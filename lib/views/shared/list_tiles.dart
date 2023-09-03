import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  const ListTiles({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: ListTile(
        trailing: Icon(icon),
        title: Text(
          title,
        ),
        onTap: () {},
      ),
    );
  }
}
