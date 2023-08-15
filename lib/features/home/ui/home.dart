import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkshit_madan_bloc/features/cart/ui/cart.dart';
import 'package:mkshit_madan_bloc/features/home/bloc/home_bloc.dart';
import 'package:mkshit_madan_bloc/features/home/ui/product_tile_widget.dart';
import 'package:mkshit_madan_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        return current is HomeActionState;
      },
      buildWhen: (previous, current) {
        return current is! HomeActionState;
      },
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Cart(),
          ));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Wishlist(),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Sadid Shop'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    productDataModel: successState.products[index],
                  );
                },
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
