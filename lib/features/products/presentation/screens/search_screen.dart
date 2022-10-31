import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/product_details_screen.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../core/components/defaults.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_fileds_controlers/textfiled_controlers.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () async {
          TextFormFieldControllers.homeSearchController.clear();
          Navigator.of(context).pop();
          return false;
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: AppColors.transparentColor,
            elevation: AppElevation.eL0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                TextFormFieldControllers.homeSearchController.clear();
                Navigator.of(context).pop();
              },
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
              child: mobileHomeSearchBar(
                onChanged: (value) {
                  if (TextFormFieldControllers
                      .homeSearchController.text.isEmpty) {
                    return;
                  }
                  Future.delayed(const Duration(seconds: 2), () {
                    context
                        .read<AllProductsBloc>()
                        .add(SearchAboutProductEvent(value.trim()));
                  });
                },
                onSubmit: (value) {
                  context
                      .read<AllProductsBloc>()
                      .add(SearchAboutProductEvent(value));
                },
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.iconColorGrey,
                ),
                label: Text('Search',
                    style: Theme.of(context).textTheme.labelMedium),
                context: context,
                width: double.infinity,
                height: double.infinity,
                radius: AppRadius.r5,
                controller: TextFormFieldControllers.homeSearchController,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p12,
              right: AppPadding.p12,
              top: AppPadding.p12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.foundedSearchIteam.isEmpty
                    ? const Center(
                        child: Text('No Data'),
                      )
                    : Expanded(
                        child: ListView.separated(
                          itemCount: state.foundedSearchIteam.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CachedNetworkImage(
                                filterQuality: FilterQuality.low,
                                imageBuilder: (context, imageprovider) =>
                                    Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageprovider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                imageUrl:
                                    state.foundedSearchIteam[index].imageUrl,
                                placeholder: (context, url) {
                                  return const CircularProgressIndicator();
                                },
                              ),
                              title: Text(
                                state.foundedSearchIteam[index].name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (_) {
                                        return ProductDetailsScreen(
                                          description: state
                                              .foundedSearchIteam[index]
                                              .description,
                                          sunLight: state
                                              .foundedSearchIteam[index]
                                              .sunLight,
                                          temperature: state
                                              .foundedSearchIteam[index]
                                              .temperature,
                                          title: state
                                              .foundedSearchIteam[index].name,
                                          waterCapacity: state
                                              .foundedSearchIteam[index]
                                              .waterCapacity,
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: AppColors.iconColorGrey,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              thickness: 2,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
