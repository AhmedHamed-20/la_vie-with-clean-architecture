import 'package:flutter/material.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/text_fileds_controlers/textfiled_controlers.dart';

class HomeScreenSearchBarRow extends StatelessWidget {
  const HomeScreenSearchBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {},
              child: mobileHomeSearchBar(
                enabled: false,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.iconColorGrey,
                ),
                label: Text(
                  'Search',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.titleTextColor,
                      ),
                ),
                context: context,
                height: AppHeight.h10,
                width: double.infinity,
                radius: AppRadius.r18,
                controller: TextFormFieldControllers.homeSearchController,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutesNames.cartScreen);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.r5),
                ),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.iconColorWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
