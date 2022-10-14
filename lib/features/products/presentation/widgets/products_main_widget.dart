import 'package:flutter/material.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/widgets/products_card.dart';
import 'home_screen_search_bar_row.dart';
import 'home_tabs.dart';

class ProductsMainWidget extends StatelessWidget {
  const ProductsMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Flexible(flex: 2, child: HomeScreenSearchBarRow()),
        Flexible(flex: 2, child: HomeTabs()),
        Flexible(flex: 16, child: ProductsCard()),
      ],
    );
  }
}
