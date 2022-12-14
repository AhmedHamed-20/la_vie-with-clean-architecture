import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/widgets/cart/cart_empty_widget.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utl/utls.dart';
import '../widgets/cart/cart_data_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            if (state.productsDatabaseEntitie.isEmpty) {
              return const CartEmptyWidget();
            }
            switch (state.cartRequestState) {
              case CartRequestState.loading:
                context
                    .read<AllProductsBloc>()
                    .add(const AllProductsFromDatabaseEvent('cart'));
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case CartRequestState.loaded:
                return const CartDataWidget();
              case CartRequestState.insertedSuccessfully:
                return const CartDataWidget();
              case CartRequestState.deletedSuccessfully:
                return const CartDataWidget();
              case CartRequestState.error:
                return const Center(
                  child: Text('error'),
                );
            }
          },
        ));
  }
}
