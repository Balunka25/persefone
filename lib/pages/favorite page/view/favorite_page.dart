import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:persefone/core/generics/resource.dart';
import 'package:persefone/core/widgets/stylish_drawer.dart';
import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/favorite%20page/controller/favorite_controller.dart';
import 'package:persefone/core/widgets/custom_appbar.dart';
import 'package:persefone/core/models/image_model.dart';

import 'widgets/app_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = FavoriteController();

  @override
  void initState() {
    _controller.getUserFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
        ),
        child: Scaffold(
          drawer: const StylishDrawer(),
          backgroundColor: Colors.transparent,
          appBar: Appbar(),
          body: Observer(builder: (_) {
            final favorites = _controller.favoriteList;
            return _controller.favoriteStatus.status == Status.loading
                ? Center(
                    child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_3lmp8ylk.json",
                    ),
                  )
                : ListView( 
                  children: [
                    for(final favorite in favorites) 
                        CachedNetworkImage(imageUrl: favorite['url'],)
                  ],
                );
          }),
        )
      );
  }
}
