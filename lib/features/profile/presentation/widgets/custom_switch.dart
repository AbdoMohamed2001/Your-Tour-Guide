import 'package:flutter/material.dart';
import 'package:your_tour_guide/core/utils/theme/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  CustomSwitchState createState() => CustomSwitchState();
}

class CustomSwitchState extends State<CustomSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isOn = !isOn),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 30,
        height: 17,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isOn ? AppColors.primaryColor : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment: isOn
                  ? Alignment.centerLeft
                  : Alignment.centerRight, // flipped
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
