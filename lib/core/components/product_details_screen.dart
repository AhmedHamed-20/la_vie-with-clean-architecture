import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/details_screen_widgets/down_details_screen_widget.dart';
import '../widgets/details_screen_widgets/upper_details_screen_widget.dart';
import 'defaults.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.sunLight,
    required this.title,
    required this.waterCapacity,
    required this.description,
    required this.temperature,
    this.additiontalDescription,
  });
  final int sunLight;
  final String title;
  final int waterCapacity;
  final int temperature;
  final String description;
  final String? additiontalDescription;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: UpperDetailsScreenWidget(
                  sunLight: sunLight,
                  waterCapacity: waterCapacity,
                  temperature: temperature),
            ),
          ),
          Flexible(
            child: DownDetailsScreenWidget(
                title: title,
                description: description,
                additiontalDescription: additiontalDescription),
          ),
        ],
      ),
    );
  }
}
