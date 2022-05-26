import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:persefone/core/widgets/dialog_box.dart';
import 'package:persefone/pages/login%20page/view/login_page.dart';
import 'package:persefone/pages/profile%20page/controller/user_image_controller.dart';
import 'package:persefone/pages/profile%20page/view/widgets/profile_page_appbar.dart';
import '../../../design/my_colors.dart';
import '../../upload image/view/upload_image_page.dart';
import '../models/image_model.dart';

class ProfilePage extends StatefulWidget with PreferredSizeWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  Size get preferredSize => const Size.fromHeight(170.0);
}

File? image;

class _ProfilePageState extends State<ProfilePage> {
  final UserImageController controller = UserImageController();
  @override
  void initState() {
    _setupPage();
  }

  Future<void> _setupPage() async {
    await controller.countDocuments();
    await controller.getEmail();
    await controller.getUserName();
    await controller.getImages();
  }

  @override
  Widget build(BuildContext context) {
      return Observer(
        builder: (context) {
          return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/backgroud.png"),
                    fit: BoxFit.cover),
              ),
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: NestedScrollView(
                      floatHeaderSlivers: true,
                      headerSliverBuilder: (context, innerBoxIsScrolled) =>
                          [const ProfilePageAppBar()],
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.userName.toUpperCase(), style: Theme.of(context).textTheme.headline2!.copyWith(color: MyColors.primarydark, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "lib/images/profile_page_vaso.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Text(
                                  controller.userEmail,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: MyColors.primarydark),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 40),
                                Text(
                                  "Minhas Plantas",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: MyColors.primarydark),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.add_box_outlined,
                                      size: 30,
                                      color: Colors.green[700],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const UploadImagePage())));
                                    }),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(32),
                                child: ObserverFuture<List<ImageModel>, Exception>(
                                  autoInitialize: true,
                                  fetchData: controller.getPostsFromMobxWidget,
                                  observableFuture: () => controller.imagesUser,
                                  onData: (_, data) {
                                    if (data.length == 0) {
                                      return const Center(
                                          child:
                                              Text("Você não criou nenhum post"));
                                    }
                                    return GridView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15,
                                      ),
                                      itemCount: controller.totalImages,
                                      itemBuilder: (context, index) {
                                        var post = data[index];
                                        return CachedNetworkImage(
                                          imageUrl: post.url,
                                          imageBuilder: (context, imageProvider) =>
                                              Container(
                                            width: 300,
                                            height: 400,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ),
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                                  Center(
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
                                  onError: (_, error) => const Text(
                                      'Ocorreu um erro ao pesquisar os posts'),
                                  onPending: (_) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onUnstarted: (_) => const Text(''),
                                )),
                          ],
                        ),
                      ),
                    )),
              ));
        }
      );
    }
  }

  


  

