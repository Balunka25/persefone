import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../design/my_colors.dart';
import '../../register page/controller/register_controller.dart';

class ImageDetailsPage extends StatefulWidget {
  final String? imageUrl;
  final String? ownerId;
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
  }

  _shareContent() async {
    Share.share(widget.imageUrl!);
  }

  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    final _controller = RegisterController();
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/images/backgroud.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl!,
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
              const SizedBox(height: 30),
              ElevatedButton(
                // onPressed: () async {
                //   int intValue = int.parse(
                //       _controller.phone.replaceAll(RegExp('[^0-9]'), ''));
                //   String url =
                //       "https://api.whatsapp.com/send?phone=+55$intValue&text=Ol%C3%A1!%20Vi%20seu%20perfil%20no%20D%C3%A1%20um%20Help!%20e%20gostaria%20de%20uma%20monitoria,%20poderia%20me%20ajudar?";
                //   await launchURL(url);
                // },
                onPressed: () async {
                  openWhatsapp();
                },
                child: Text("Contatar",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 28)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MyColors.primaryyellow),
                ),
              ),
              IconButton(
                  onPressed: (() async => {await _shareContent()}),
                  icon: const Icon(Icons.share, color: MyColors.primarydark)),
            ],
          )),
    );
  }

  Future<void> getPhoneNumber() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(widget.ownerId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      phoneNumber = data['phone'];
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
