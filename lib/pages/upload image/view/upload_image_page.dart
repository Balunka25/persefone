import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../profile page/view/profile_page.dart';

class UploadImagePage extends StatefulWidget with PreferredSizeWidget {
  const UploadImagePage({Key? key}) : super(key: key);

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();

  @override
  Size get preferredSize => const Size.fromHeight(170.0);
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? image;
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserId();
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
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 170,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/images/gif_planta_uploadimage.gif"),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 32,
                ),
                image != null
                    ? Image.file(
                        image!,
                        width: 200,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    // : CachedNetworkImage(
                    //     progressIndicatorBuilder:
                    //         (context, url, downloadProgress) =>
                    //             CircularProgressIndicator(
                    //                 value: downloadProgress.progress),
                    //     errorWidget: (context, url, error) =>
                    //         const Icon(Icons.error),
                    //     imageUrl:
                    //         "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Picture_icon_BLACK.svg/1200px-Picture_icon_BLACK.svg.png",
                    //     imageBuilder: (context, imageProvider) => Container(
                    //       height: 320,
                    //       width: 320,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.rectangle,
                    //         borderRadius: BorderRadius.circular(10),
                    //         image: DecorationImage(
                    //             image: imageProvider, fit: BoxFit.cover),
                    //       ),
                    //     ),
                    //   ),
                    : Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: const Border(
                            bottom: BorderSide(
                              width: 4,
                              color: Colors.black,
                            ),
                            top: BorderSide(
                              width: 4,
                              color: Colors.black,
                            ),
                            left: BorderSide(
                              width: 4,
                              color: Colors.black,
                            ),
                            right: BorderSide(
                              width: 4,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_box_outlined,
                        size: 50,
                        color: Colors.green[700],
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                      leading: const Icon(Icons.photo_camera),
                                      title: const Text("Tirar foto"),
                                      onTap: () async {
                                        try {
                                          final image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          if (image == null) return;
                                          final imageTemporary =
                                              File(image.path);
                                          setState(() {
                                            this.image = imageTemporary;
                                          });
                                        } on PlatformException catch (e) {
                                          print("Failed to pick image: $e");
                                        }
                                        Navigator.pop(context);
                                      }),
                                  ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: const Text(
                                          "Escolha uma foto da biblioteca"),
                                      onTap: () async {
                                        try {
                                          final image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          if (image == null) return;
                                          final imageTemporary =
                                              File(image.path);
                                          setState(() {
                                            this.image = imageTemporary;
                                          });
                                        } on PlatformException catch (e) {
                                          print("Failed to pick image: $e");
                                        }
                                        Navigator.pop(context);
                                      }),
                                ],
                              );
                            });
                      },
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 50,
                        color: Colors.orange[600],
                      ),
                      onPressed: () {
                        setState(() {
                          image = null;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.yellow,
                    primary: Colors.green[900],
                  ),
                  onPressed: () async {
                    if (image == null) return;
                    try {
                      String ref =
                          // "images/${widget.currentUserModel.sId}/${DateTime.now().toString()}.jpg";
                          "images/${DateTime.now().toString()}.jpg";

                      await FirebaseStorage.instance.ref(ref).putFile(image!);
                      final datetime = DateTime.now().toString();
                      final imageUrl = await FirebaseStorage.instance
                          .ref()
                          .child(ref)
                          .getDownloadURL();
                      var currentUser = FirebaseAuth.instance.currentUser;
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(userId)
                          .collection("images")
                          .doc(datetime)
                          .set(
                        {
                          "url": imageUrl,
                          "id": datetime,
                          "owner_id": currentUser!.uid
                        },
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfilePage()));
                    } on FirebaseException catch (e) {
                      throw Exception("Erro: $e");
                    }
                  },
                  icon: const FaIcon(FontAwesomeIcons.seedling),
                  label: Text(
                    "Share your plant",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> getUserId() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      setState(() {
        userId = data['id'];
      });
    });
  }
}
