import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utl/utls.dart';
import '../widgets/cart/cart_data_widget.dart';
import '../widgets/cart/cart_empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Card',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.iconColorGrey,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            switch (state.cartRequestState) {
              case CartRequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case CartRequestState.loaded:
                return const CartDataWidget();
              case CartRequestState.insertedSuccessfully:
                return const CartEmptyWidget();
              case CartRequestState.deletedSuccessfully:
                return const CartEmptyWidget();
              case CartRequestState.error:
                return const Center(
                  child: Text('erro'),
                );
            }
          },
        ));
  }
}
