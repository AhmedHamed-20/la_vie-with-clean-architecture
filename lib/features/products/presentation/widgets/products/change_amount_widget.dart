import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../bloc/all_products_bloc.dart';

class ChangeAmountWidget extends StatelessWidget {
  const ChangeAmountWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<AllProductsBloc>().add(
                      AmountValueEvent(
                        id: state.activeEntitie[index]['entitie'].id,
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
            );
          },
        ),
        BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            return Text(
              state
                  .amountOfAllProducts[state.activeEntitie[index]['entitie'].id]
                  .toString(),
              style: Theme.of(context).textTheme.titleMedium,
            );
          },
        ),
        BlocBuilder<AllProductsBloc, AllProductsState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<AllProductsBloc>().add(
                      AmountValueEvent(
                        id: state.activeEntitie[index]['entitie'].id,
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
            );
          },
        ),
      ],
    );
  }
}
