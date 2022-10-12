import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/widgets/products_card.dart';

import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';
import '../../../../core/utl/utls.dart';
import '../../../../core/widgets/tob_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          switch (state.requestState) {
            case AllProductsRequestState.idle:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AllProductsRequestState.accessTokenGetSuccess:
              accessToken = state.accessToken;
              context
                  .read<AllProductsBloc>()
                  .add(GetUserDataEvent(accessToken));
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AllProductsRequestState.userDataGetSuccess:
              context.read<AllProductsBloc>().add(
                    AllProductsEvent(
                      accessToken,
                    ),
                  );
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AllProductsRequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AllProductsRequestState.loaded:
              if (state.activeEntitie == const []) {
                context.read<AllProductsBloc>().add(
                    const CurrentActiveTabIndexEvent(currentActiveTabIndex: 0));
              }

              return Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      child: Row(
                        children: [
                          // Expanded(
                          //   flex: 4,
                          //   child: GestureDetector(
                          //     onTap: () {},
                          //     child: mobileHomeSearchBar(
                          //       enabled: false,
                          //       prefixIcon: Icon(
                          //         Icons.search,
                          //         color: AppColors.iconColorGrey,
                          //       ),
                          //       label: Text(
                          //         'Search',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .labelMedium
                          //             ?.copyWith(
                          //               color: AppColors.titleTextColor,
                          //             ),
                          //       ),
                          //       context: context,
                          //       height: AppHeight.h10,
                          //       width: double.infinity,
                          //       radius: AppRadius.r18,
                          //       controller: TextFormFieldControllers
                          //           .homeSearchController,
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r5),
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
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<AllProductsBloc>().add(
                                CurrentActiveTabIndexEvent(
                                    currentActiveTabIndex: index));
                          },
                          child: TobTabs(
                            context: context,
                            tabs: const ['All', 'Plants', 'Seeds', 'Tools'],
                            currentActiveTab: state.currentActiveTabIndex,
                            currentWidgetIndex: index,
                          ),
                        );
                      },
                    ),
                  ),
                  const Flexible(flex: 16, child: ProductsCard()),
                ],
              );
            case AllProductsRequestState.error:
              return const Center(
                child: Text('error'),
              );
          }
        },
      ),
    );
  }
}
