import 'package:dogs_ranking/core/switch_view/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

class AppBarSwitchWidget extends StatelessWidget {
  const AppBarSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(
        children: const [
          Icon(Icons.person),
          SwitchThemeWidget(),
          Icon(Icons.remove_red_eye),
        ],
      ),
    );
  }
}