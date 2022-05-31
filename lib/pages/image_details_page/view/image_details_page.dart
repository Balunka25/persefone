import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persefone/pages/explore%20page/view/explore_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persefone/pages/profile%20page/view/profile_page.dart';
import 'package:persefone/pages/user_page/view/user_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../design/my_colors.dart';
import 'package:http/http.dart' as http;

class ImageDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String ownerId;
  const ImageDetailsPage(
      {Key? key, required this.imageUrl, required this.ownerId})
      : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  @override
  void initState() {
    super.initState();
    getPhoneNumber();
    getUsername();
  }

  _shareContent() async {
    final imageurl = widget.imageUrl;
    final uri = Uri.parse(imageurl);
    final response = await http.get(uri);
    final bytes = response.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path]);
  }

  String? phoneNumber;
  String username = '';

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
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ExplorePage()));
              }),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.network(
                "https://assets10.lottiefiles.com/packages/lf20_rrxopmmf.json",
                width: 200,
                height: 60,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    width: 300,
                    height: 400,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                child: Text(
                  username,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: MyColors.primarygreen),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => UserPage(
                                ownerId: widget.ownerId,
                              ))));
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      openWhatsapp();
                    },
                    child: Text("Contatar",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 28)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyColors.primaryyellow),
                    ),
                  ),
                  IconButton(
                    onPressed: (() async => {await _shareContent()}),
                    icon: const Icon(Icons.share, color: MyColors.primarydark),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_c9bkfhmo.json",
                        fit: BoxFit.fill,
                        height: 100),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
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

  openWhatsapp() async {
    var texto = "Olá! Tenho interesse em sua plantinha!";
    var whatsappURl =
        "https://api.whatsapp.com/send?phone=+55$phoneNumber&text=$texto";
    try {
      await launchUrlString(whatsappURl, mode: LaunchMode.externalApplication);
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Whatsapp not installed")));
    }
  }
}
