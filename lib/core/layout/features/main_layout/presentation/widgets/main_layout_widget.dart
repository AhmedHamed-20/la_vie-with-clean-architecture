import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:la_vie_with_clean_architecture/core/layout/features/main_layout/presentation/widgets/screens_widget.dart';
import 'package:la_vie_with_clean_architecture/features/products/presentation/bloc/all_products_bloc.dart';

import '../../../../../constants/constants.dart';
import '../bloc/main_layout_bloc.dart';

class MainLayoutWidget extends StatefulWidget {
  const MainLayoutWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  @override
  void initState() {
    BlocProvider.of<AllProductsBloc>(context)
        .add(const AllProductsFromDatabaseEvent('cart'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<MainLayoutBloc, MainLayoutState>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            clipBehavior: Clip.antiAlias,
            onPressed: () {
              context
                  .read<MainLayoutBloc>()
                  .add(const ActiveScreenIndexEvent(2));
            },
            child: Icon(
              IconlyBroken.home,
              color: AppColors.iconColorWhite,
            ),
          );
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutesNames.forumsScreen);
            },
            icon: Icon(
              Icons.forum,
              color: AppColors.iconColorGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.question_mark,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
        backgroundColor: AppColors.transparentColor,
        elevation: AppElevation.eL0,
        title: BlocBuilder<MainLayoutBloc, MainLayoutState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: appBarWidgets(context, state.currentBottomNavIndex),
            );
          },
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).backgroundColor,
        shape: const CircularNotchedRectangle(),
        elevation: AppElevation.eL4,
        notchMargin: AppPadding.p8,
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutesNames.blogsScreen);
              },
              icon: Icon(
                Icons.nature_outlined,
                color: Theme.of(context).iconTheme.color,
                size: AppHeight.h28,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutesNames.scanScreen);
              },
              icon: Icon(
                IconlyBroken.scan,
                color: Theme.of(context).iconTheme.color,
                size: AppHeight.h28,
              ),
            ),
            const SizedBox.shrink(),
            IconButton(
              onPressed: () {
                context
                    .read<MainLayoutBloc>()
                    .add(const ActiveScreenIndexEvent(3));
              },
              icon: Icon(
                IconlyBroken.notification,
                color: Theme.of(context).iconTheme.color,
                size: AppHeight.h28,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutesNames.userProfileScreen,
                );
              },
              icon: Icon(
                IconlyBroken.profile,
                color: Theme.of(context).iconTheme.color,
                size: AppHeight.h28,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<MainLayoutBloc, MainLayoutState>(
        builder: (context, state) {
          return mainScreens[state.currentBottomNavIndex];
        },
      ),
    );
  }
}
