import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/defaults.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';
import '../../../../core/utl/utls.dart';
import '../../../../core/widgets/error_401_widget.dart';
import '../widgets/products/products_main_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AllProductsBloc, AllProductsState>(
        listener: (context, state) {
          if (state.cartRequestState.name == 'insertedSuccessfully') {
            flutterToast(
                msg: 'added to your cart',
                backgroundColor: AppColors.toastSuccess,
                textColor: AppColors.white);
          }
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
                      savedaccessToken,
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
              if (state.statusCode == 401 ||
                  state.allProductsErrorMessage == 'Unauthorized') {
                return const Error401Screen();
              } else {
                return Column(
                  children: [
                    Center(
                      child: Text(state.allProductsErrorMessage == ''
                          ? 'error'
                          : state.allProductsErrorMessage),
                    ),
                    defaultButton(
                        onPressed: () {
                          context.read<AllProductsBloc>().add(AllProductsEvent(
                                savedaccessToken,
                              ));
                        },
                        buttonChild: Text(
                          'Retry',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        width: AppWidth.w44,
                        height: AppHeight.h46),
                  ],
                );
              }
          }
        },
      ),
    );
  }
}
