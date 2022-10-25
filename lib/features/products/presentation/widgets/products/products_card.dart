import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/product_details_screen.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/all_products_bloc.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsBloc, AllProductsState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.only(
              top: AppPadding.p40, left: AppPadding.p10, right: AppPadding.p10),
          itemCount: state.activeEntitie.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ProductDetailsScreen(
                        sunLight:
                            state.activeEntitie[index]['entitie'].sunLight,
                        title: state.activeEntitie[index]['entitie'].name,
                        waterCapacity:
                            state.activeEntitie[index]['entitie'].waterCapacity,
                        description:
                            state.activeEntitie[index]['entitie'].description,
                        temperature:
                            state.activeEntitie[index]['entitie'].temperature,
                      );
                    });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppRadius.r10,
                  ),
                ),
                elevation: AppElevation.eL2,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -10,
                        top: -50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.r10),
                          child: Image.network(
                            state.activeEntitie[index]['entitie'].imageUrl,
                            fit: BoxFit.fitWidth,
                            width: AppWidth.w100,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<AllProductsBloc>().add(
                                      AmountValueEvent(
                                        id: state
                                            .activeEntitie[index]['entitie'].id,
                                        isIncrement: false,
                                      ),
                                    );
                              },
                              child: Container(
                                color: AppColors.textFormFieldFillColor,
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.iconColorGrey,
                                ),
                              ),
                            ),
                            Text(
                              state.amountOfAllProducts[
                                      state.activeEntitie[index]['entitie'].id]
                                  .toString(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.read<AllProductsBloc>().add(
                                      AmountValueEvent(
                                        id: state
                                            .activeEntitie[index]['entitie'].id,
                                        isIncrement: true,
                                      ),
                                    );
                              },
                              child: Container(
                                color: AppColors.textFormFieldFillColor,
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.iconColorGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.activeEntitie[index]['entitie'].name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              state.activeEntitie[index]['entitie'].description,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: MaterialButton(
                                color: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r5),
                                ),
                                onPressed: () {
                                  context.read<AllProductsBloc>().add(
                                        DatabaseInsertionEvent(
                                          amount: state.amountOfAllProducts[
                                              state
                                                  .activeEntitie[index]
                                                      ['entitie']
                                                  .id]!,
                                          productId: state
                                              .activeEntitie[index]['entitie']
                                              .id,
                                          name: state
                                              .activeEntitie[index]['entitie']
                                              .name,
                                          description: state
                                              .activeEntitie[index]['entitie']
                                              .description,
                                          imageUrl: state
                                              .activeEntitie[index]['entitie']
                                              .imageUrl,
                                          price: state.activeEntitie[index]
                                              ['price'],
                                        ),
                                      );
                                  context.read<AllProductsBloc>().add(
                                      const AllProductsFromDatabaseEvent(
                                          'cart'));
                                },
                                child: Text(
                                  'Add To Cart',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppWidth.w10,
            mainAxisSpacing: AppHeight.h80,
          ),
        );
      },
    );
  }
}
