import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_with_clean_architecture/core/components/product_details_screen.dart';
import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';
import 'package:la_vie_with_clean_architecture/core/services/service_locator.dart';
import 'package:la_vie_with_clean_architecture/features/scan/presentation/bloc/scan_bloc.dart';

import '../../../../core/utl/utls.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => servicelocator<ScanBloc>()..add(ScanQrCodeEvent()),
        child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.transparentColor,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).iconTheme.color,
                  )),
            ),
            body: BlocConsumer<ScanBloc, ScanState>(
              builder: (context, state) {
                switch (state.productDetailsRequestState) {
                  case ProductDetailsRequestState.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ProductDetailsRequestState.loaded:
                    return const Center(
                      child: Text('loaded'),
                    );
                  case ProductDetailsRequestState.error:
                    return const Center(
                      child: Text('loaded'),
                    );
                }
              },
              listener: (context, state) {
                if (state.productDetailsRequestState.name == 'loaded') {
                  // Navigator.of(context).pop();
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        switch (state.productByIdEntitie!.type) {
                          case 'PLANT':
                            return ProductDetailsScreen(
                                sunLight: state
                                    .productByIdEntitie!.plantEntitie!.sunLight,
                                title: state
                                    .productByIdEntitie!.plantEntitie!.name,
                                waterCapacity: state.productByIdEntitie!
                                    .plantEntitie!.waterCapacity,
                                description: state.productByIdEntitie!
                                    .plantEntitie!.description,
                                temperature: state.productByIdEntitie!
                                    .plantEntitie!.temperature);

                          case 'SEED':
                            return ProductDetailsScreen(
                                sunLight: state
                                    .productByIdEntitie!.seedEntitie!.sunLight,
                                title:
                                    state.productByIdEntitie!.seedEntitie!.name,
                                waterCapacity: state.productByIdEntitie!
                                    .seedEntitie!.waterCapacity,
                                description: state.productByIdEntitie!
                                    .seedEntitie!.description,
                                temperature: state.productByIdEntitie!
                                    .seedEntitie!.temperature);
                          case 'TOOL':
                            return ProductDetailsScreen(
                                sunLight: state
                                    .productByIdEntitie!.toolEntitie!.sunLight,
                                title:
                                    state.productByIdEntitie!.toolEntitie!.name,
                                waterCapacity: state.productByIdEntitie!
                                    .toolEntitie!.waterCapacity,
                                description: state.productByIdEntitie!
                                    .toolEntitie!.description,
                                temperature: state.productByIdEntitie!
                                    .toolEntitie!.temperature);
                          default:
                            return ProductDetailsScreen(
                                sunLight: state
                                    .productByIdEntitie!.plantEntitie!.sunLight,
                                title: state
                                    .productByIdEntitie!.plantEntitie!.name,
                                waterCapacity: state.productByIdEntitie!
                                    .plantEntitie!.waterCapacity,
                                description: state.productByIdEntitie!
                                    .plantEntitie!.description,
                                temperature: state.productByIdEntitie!
                                    .plantEntitie!.temperature);
                        }
                      });
                }
                if (state.scanResult.isNotEmpty) {
                  context.read<ScanBloc>().add(ProductByIdEvent(
                      accessToken: savedaccessToken,
                      productId: state.scanResult));
                }
              },
            ),
          ),
        ));
  }
}
