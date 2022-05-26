import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final UserImageController store = UserImageController();
  @override
  void initState() {
    _setupPage();
  }

  Future<void> _setupPage() async {
    await countDocuments();
    await getEmail();
    await getUserName();
    await store.getImages();
  }

  int? totalImages;
  String? userEmail;
  String? userName;

  @override
  Widget build(BuildContext context) {
    if (userEmail == null) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (userName == null) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
        ),
        child: const Center(child: CircularProgressIndicator()),
      );
    } else {
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
                            Text(userName!.toUpperCase(), style: Theme.of(context).textTheme.headline2!.copyWith(color: MyColors.primarydark, fontWeight: FontWeight.bold),)
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
                              userEmail!,
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
                              fetchData: store.getPostsFromMobxWidget,
                              observableFuture: () => store.imagesUser,
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
                                  itemCount: totalImages,
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
  }

  Future<void> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("images")
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    totalImages = _myDocCount.length;
  }

  Future<void> getEmail() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        userEmail = data['email'];
      });
    });
  }

  Future<void> getUserName() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        userName = data['name'];
      });
    });
  }
}
