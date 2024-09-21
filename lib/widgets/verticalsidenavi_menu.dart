import 'package:flutter/material.dart';
import 'package:inventarko/utils/constants.dart';

class VerticalSideNaviMenu extends StatefulWidget {
  final List<NavBarMenuItem> menuItems;
  final Function(int index)? onTap;
  final int? currentIndex;
  final double iconSize;

  const VerticalSideNaviMenu(
      {super.key,
      required this.menuItems,
      this.onTap,
      this.currentIndex,
      required this.iconSize});

  @override
  State<VerticalSideNaviMenu> createState() => _VerticalSideNaviMenuState();
}

class _VerticalSideNaviMenuState extends State<VerticalSideNaviMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultSpace / 2),
      width: 84,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.white10,
        border: Border(right: BorderSide(color: Colors.black26, width: .6)),
      ),
      child: Column(
        children: [
          ...widget.menuItems.map((menu) => InkWell(
                onTap: () => widget.onTap!(widget.menuItems.indexOf(menu)),
                child: Padding(
                  padding: const EdgeInsets.only(top: defaultSpace * 1.85),
                  child: Icon(
                    menu.icon,
                    color: widget.currentIndex == widget.menuItems.indexOf(menu)
                        ? primaryColor
                        : Colors.black54,
                    size: widget.iconSize,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class NavBarMenuItem {
  final IconData icon;

  NavBarMenuItem({required this.icon});
}
