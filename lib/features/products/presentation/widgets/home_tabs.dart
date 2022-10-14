import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/tob_tab.dart';
import '../bloc/all_products_bloc.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context
                .read<AllProductsBloc>()
                .add(CurrentActiveTabIndexEvent(currentActiveTabIndex: index));
          },
          child: BlocBuilder<AllProductsBloc, AllProductsState>(
            builder: (context, state) {
              return TobTabs(
                context: context,
                tabs: const ['All', 'Plants', 'Seeds', 'Tools'],
                currentActiveTab: state.currentActiveTabIndex,
                currentWidgetIndex: index,
              );
            },
          ),
        );
      },
    );
  }
}
