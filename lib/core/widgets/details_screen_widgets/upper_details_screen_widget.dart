import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class UpperDetailsScreenWidget extends StatelessWidget {
  const UpperDetailsScreenWidget({
    Key? key,
    required this.sunLight,
    required this.waterCapacity,
    required this.temperature,
  }) : super(key: key);

  final int sunLight;
  final int waterCapacity;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) * 0.5,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.black.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Icon(
                      Icons.wb_sunny_outlined,
                      color: AppColors.iconColorGrey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppWidth.w8,
                ),
                Text(
                  '$sunLight % \nSun Light',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Icon(
                      Icons.water_drop_outlined,
                      color: AppColors.iconColorGrey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppWidth.w8,
                ),
                Text(
                  '$waterCapacity % \nWater Capacity',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Icon(
                      Icons.device_thermostat,
                      color: AppColors.iconColorGrey,
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppWidth.w8,
                ),
                Text(
                  '$temperature c \nTemperature',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
