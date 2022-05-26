import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';

import '../../home page/view/widgets/custom_appbar.dart';
import '../../profile page/models/image_model.dart';
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
    await controller.getUserImagesCount();
    await controller.getTotalImagesCount();
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
        backgroundColor: Colors.transparent,
        appBar: CustomAppbar(),
        body:   Observer(
          builder: (context) {
            return Padding(
                padding: const EdgeInsets.all(32),
                child: ObserverFuture<List<ImageModel>, Exception>(
                  autoInitialize: true,
                  fetchData: controller.getPostsFromMobxWidget,
                  observableFuture: () => controller.allImages,
                  onData: (_, data) {
                    if (data.length == 0) {
                      return const Center(
                          child: Text("Você não compartilhou nenhuma planta."));
                    }
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: controller.imagesCount,
                      itemBuilder: (context, index) {
                        var post = data[index];
                        return CachedNetworkImage(
                          imageUrl: post.url,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      },
                    );
                  },
                  onNull: (_) => const Text('Nenhum post criado'),
                  onError: (_, error) =>
                      const Text('Ocorreu um erro ao pesquisar os posts'),
                  onPending: (_) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                  onUnstarted: (_) => const Text(''),
                ));
          }
        ),
      ),
    );
  }
}
