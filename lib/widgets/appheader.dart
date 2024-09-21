import 'package:flutter/material.dart';
import 'package:inventarko/utils/constants.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    //frontend
    return Container(
      height: 70,
      padding: const EdgeInsets.all(defaultSpace / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12, width: 9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
            child: Row(
              children: [
                Text(
                  "Inventarko",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Icon(
                  Icons.warehouse_sharp,
                  shadows: [
                    Shadow(
                        color: primaryColor,
                        offset: Offset.fromDirection(0.3),
                        blurRadius: 0.493),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpace),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: iconBackdropColor),
                  child: const Icon(
                    Icons.notifications,
                    size: 17,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  width: defaultSpace,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: primaryColor),
                  child: const Center(
                    child: Text(
                      "ĐS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
