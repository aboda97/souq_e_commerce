import 'package:flutter/material.dart';
import 'package:souq_app/features/home_feature/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBarSouq extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  const CustomBottomNavigationBarSouq({super.key, required this.onItemTapped});

  @override
  State<CustomBottomNavigationBarSouq> createState() => _CustomBottomNavigationBarSouqState();
}

class _CustomBottomNavigationBarSouqState extends State<CustomBottomNavigationBarSouq> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: bottomNavigationBarListItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onItemTapped(index);
                });
              },
              child: NaivgationBarItem(
                isSelected: selectedIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}