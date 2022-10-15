import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';
import '../../../../core/utl/utls.dart';
import '../../../../core/widgets/error_widget.dart';
import '../widgets/products/products_main_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AllProductsBloc, AllProductsState>(
        listener: (context, state) {
          if (state.productExist) {
            flutterToast(
                msg: 'Product exist in cart',
                backgroundColor: AppColors.toastWarning,
                textColor: AppColors.black);
          }
        },
        builder: (context, state) {
          switch (state.requestState) {
            case AllProductsRequestState.idle:
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
                context
                    .read<AllProductsBloc>()
                    .add(AmountMapEvent(state.allProductsEntitie));
              }
              return const ProductsMainWidget();
            case AllProductsRequestState.error:
              if (state.statusCode == 401) {
                return const ErrorScreen();
              } else {
                return const Center(
                  child: Text('error'),
                );
              }
          }
        },
      ),
    );
  }
}
