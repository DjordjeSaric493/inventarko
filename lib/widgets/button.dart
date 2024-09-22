//stateless button widget

import 'package:flutter/material.dart';
import 'package:inventarko/utils/constants.dart';

class ButtonWithIcon extends StatelessWidget {
  //what out widget must have (required) and what is optional?

  final String label;
  final IconData? icon;
  final Color? borderColor;
  final Color? labelAndIconColor;
  final double? borderRadius;
  final Function() onTap;

  const ButtonWithIcon(
      {
      //similar purpose as getter/setter in Java just way less painful
      //interact with properties of ButtomWithIcon class (these finals)
      super.key,
      required this.label,
      this.icon,
      this.borderColor,
      this.labelAndIconColor,
      this.borderRadius,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: borderColor ?? Colors.grey.withOpacity(.493),
            width: .69,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultSpace / 2),
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelAndIconColor ?? Colors.grey.withOpacity(.69),
                  ),
                ),
              ),
              Icon(
                icon,
                color: labelAndIconColor ?? Colors.grey.withOpacity(.69),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
