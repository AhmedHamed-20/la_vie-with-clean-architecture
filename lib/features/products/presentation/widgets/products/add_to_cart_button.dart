import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/all_products_bloc.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.index})
      : super(
          key: key,
        );
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (context, state) {
          return MaterialButton(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r5),
            ),
            onPressed: () {
              context.read<AllProductsBloc>().add(
                    DatabaseInsertionEvent(
                      amount: state.amountOfAllProducts[
                          state.activeEntitie[index]['entitie'].id]!,
                      productId: state.activeEntitie[index]['entitie'].id,
                      name: state.activeEntitie[index]['entitie'].name,
                      description:
                          state.activeEntitie[index]['entitie'].description,
                      imageUrl: state.activeEntitie[index]['entitie'].imageUrl,
                      price: state.activeEntitie[index]['price'],
                    ),
                  );
              context
                  .read<AllProductsBloc>()
                  .add(const AllProductsFromDatabaseEvent('cart'));
            },
            child: Text(
              'Add To Cart',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.textColorButton),
            ),
          );
        },
      ),
    );
  }
}
