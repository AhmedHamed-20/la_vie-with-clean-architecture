import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../../core/components/defaults.dart';
import '../../../../../core/constants/constants.dart';
import 'cart_card_widget.dart';

class CartDataWidget extends StatelessWidget {
  const CartDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 6,
          child: BlocBuilder<AllProductsBloc, AllProductsState>(
              builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      child: cartCardWidget(
                        context: context,
                        photoUrl: state.productsDatabaseEntitie[index].imageUrl,
                        title: Text(
                          state.productsDatabaseEntitie[index].name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subTitle: Text(
                          state.productsDatabaseEntitie[index].price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                        moreSubTitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.textFormFieldFillColor,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.remove,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppWidth.w2,
                                    ),
                                    Text(
                                      state
                                          .productsDatabaseEntitie[index].amount
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const SizedBox(
                                      width: AppWidth.w2,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      )),
                );
              },
              itemCount: state.productsDatabaseEntitie.length,
            );
          }),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '${800} EGP',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                defaultButton(
                  onPressed: () {},
                  buttonChild: Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  width: double.infinity,
                  height: AppHeight.h46,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
