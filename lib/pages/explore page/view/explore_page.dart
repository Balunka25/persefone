import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:persefone/core/widgets/stylish_drawer.dart';
import 'package:persefone/design/my_colors.dart';
import 'package:persefone/pages/image_details_page/view/image_details_page.dart';

import '../../../core/widgets/custom_appbar.dart';
import '../../../core/models/image_model.dart';
import '../controller/all_images_controller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final AllImagesController controller = AllImagesController();
  @override
  void initState() {
    _setupPage();
  }

  Future<void> _setupPage() async {
    await controller.getTotalImagesCount();
    await controller.getUserImagesCount();
    await controller.getImagesCount();
    await controller.getAllImages();
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
        appBar: CustomAppbar(),
        body: Observer(builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 700,
                    height: 700,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "lib/images/planta_longa_background.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(32),
                    child: ObserverFuture<List<ImageModelExplorer>, Exception>(
                      autoInitialize: true,
                      fetchData: controller.getPostsFromMobxWidget,
                      observableFuture: () => controller.allImagesExplorer,
                      onData: (_, data) {
                        if (data.length == 0) {
                          return const Center(
                              child: Text("Ninguém compartilhou plantas :("));
                        }
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: controller.imagesCount,
                          itemBuilder: (context, index) {
                            var post = data[index];
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        MyColors.primarygreen.withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FavoriteButton(
                                      iconSize: 50,
                                      iconColor:
                                          MyColors.primaryyellow,
                                      isFavorite: post.isFavorite,
                                      valueChanged: (_isFavorite) async {
                                        await controller.manageFavorite(post);
                                      },
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: CachedNetworkImage(
                                    imageUrl: post.url,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fitWidth),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    width: 100,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                                child: Container(
                                      width: 230,
                                      height: 230,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "lib/images/loading_leaves.gif"),
                                        ),
                                      ),
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => ImageDetailsPage(
                                              imageUrl: post.url,
                                              ownerId: post.owner_id
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onNull: (_) => const Text('Nenhum post criado'),
                      onError: (_, error) =>
                          const Text('Ocorreu um erro ao pesquisar os posts'),
                      onPending: (_) => const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primarygreen,
                        ),
                      ),
                      onUnstarted: (_) => const Text(''),
                    )
                    ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
