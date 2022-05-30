import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:persefone/core/generics/resource.dart';
import 'package:persefone/core/widgets/stylish_drawer.dart';
import 'package:persefone/pages/favorite%20page/controller/favorite_controller.dart';
import 'package:persefone/core/widgets/custom_appbar.dart';

import '../../image_details_page/view/image_details_page.dart';

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
                : ListView(children: [
                    for (final favorite in favorites)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        // child: CachedNetworkImage(
                        //   imageUrl: favorite['url'],
                        //   // imageBuilder: (context, imageProvider) => Container(
                        //   //   decoration: BoxDecoration(
                        //   //     image: DecorationImage(
                        //   //         image: imageProvider, fit: BoxFit.cover),
                        //   //     borderRadius: const BorderRadius.all(
                        //   //       Radius.circular(10),
                        //   //     ),
                        //   //   ),
                        //   // ),
                        //   progressIndicatorBuilder:
                        //       (context, url, downloadProgress) => Center(
                        //           child: Container(
                        //     width: 180,
                        //     height: 180,
                        //     decoration: const BoxDecoration(
                        //       image: DecorationImage(
                        //         image:
                        //             AssetImage("lib/images/loading_leaves.gif"),
                        //       ),
                        //     ),
                        //   )),
                        //   errorWidget: (context, url, error) =>
                        //       const Icon(Icons.error),
                        // ),
                        child: GestureDetector(
                          child: Container(
                            width: 300,
                            height: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(favorite['url']),
                                  fit: BoxFit.cover),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => ImageDetailsPage(
                                              imageUrl: favorite['url'],
                                              ownerId: favorite['owner_id']
                                            )),
                                      ),
                                    );
                                  },
                        ),
                      )
                  ]);
          }),
        ));
  }
}
