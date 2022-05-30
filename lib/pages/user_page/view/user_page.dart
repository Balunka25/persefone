import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_widget/mobx_widget.dart';
import 'package:persefone/core/widgets/custom_appbar.dart';
import 'package:persefone/pages/user_page/view/widgets/user_page_appbar.dart';

import '../../../core/models/image_model.dart';
import '../../../design/my_colors.dart';

class UserPage extends StatefulWidget {
  final String ownerId;
  const UserPage({
    Key? key,
    required this.ownerId,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    getUsername();
    getPhoneNumber();
  }

  String? username;
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/backgroud.png"),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: UserPageAppbar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        username!.toUpperCase(),
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: MyColors.primarydark,
                            fontWeight: FontWeight.bold),
                      )
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
                        phoneNumber!,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: MyColors.primarydark),
                      )
                    ],
                  ),
                  // Padding(
                  //     padding: const EdgeInsets.all(32),
                  //     child: ObserverFuture<List<ImageModel>, Exception>(
                  //       autoInitialize: true,
                  //       fetchData: controller.getPostsFromMobxWidget,
                  //       observableFuture: () => controller.imagesUser,
                  //       onData: (_, data) {
                  //         if (data.length == 0) {
                  //           return const Center(
                  //               child: Text(
                  //                   "Você não compartilhou nenhuma planta."));
                  //         }
                  //         return GridView.builder(
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           shrinkWrap: true,
                  //           gridDelegate:
                  //               const SliverGridDelegateWithFixedCrossAxisCount(
                  //             crossAxisCount: 2,
                  //             crossAxisSpacing: 20,
                  //             mainAxisSpacing: 20,
                  //           ),
                  //           itemCount: controller.totalImages,
                  //           itemBuilder: (context, index) {
                  //             var post = data[index];
                  //             return GestureDetector(
                  //               child: CachedNetworkImage(
                  //                 imageUrl: post.url,
                  //                 imageBuilder: (context, imageProvider) =>
                  //                     Container(
                  //                   decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                       image: imageProvider,
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                     borderRadius: const BorderRadius.all(
                  //                       Radius.circular(10),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 width:
                  //                     MediaQuery.of(context).size.width * 0.9,
                  //                 height:
                  //                     MediaQuery.of(context).size.width * 0.9,
                  //                 progressIndicatorBuilder:
                  //                     (context, url, downloadProgress) =>
                  //                         Center(
                  //                   child: CircularProgressIndicator(
                  //                       value: downloadProgress.progress),
                  //                 ),
                  //                 errorWidget: (context, url, error) =>
                  //                     const Icon(Icons.error),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       onNull: (_) => const Text('Nenhum post criado'),
                  //       onError: (_, error) =>
                  //           const Text('Ocorreu um erro ao pesquisar os posts'),
                  //       onPending: (_) => const Center(
                  //         child: CircularProgressIndicator(
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //       onUnstarted: (_) => const Text(''),
                  //     )),
                ],
              ),
            ),
          ));
    });
  }

  Future<void> getUsername() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(widget.ownerId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        username = data['name'];
      });
    });
  }

  Future<void> getPhoneNumber() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(widget.ownerId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        phoneNumber = data['phone'];
      });
    });
  }
}
