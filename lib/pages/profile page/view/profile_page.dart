import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:persefone/pages/profile%20page/controller/user_image_controller.dart';
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
  final UserImageController store = Modular.get();
@override
  void initState() {
    // TODO: implement initState
    store.getImages();
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
          title: Stack(
            children: [
              Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/logo_profile_page.png"),
                  ),
                ),
              ),
              Positioned(
                  top: 150,
                  left: 65,
                  child: Text(
                    "Perfil",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ))
            ],
          ),
        ),
        
        body: 
        // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const SizedBox(width: 40),
            //     Text(
            //       "Minhas Plantas",
            //       style: Theme.of(context)
            //           .textTheme
            //           .headline4!
            //           .copyWith(color: Colors.black),
            //     ),
            //     IconButton(
            //         icon: Icon(
            //           Icons.add_box_outlined,
            //           size: 30,
            //           color: Colors.green[700],
            //         ),
            //         onPressed: () {
            //           Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: ((context) => const UploadImagePage())));
            //         }),
            //   ],
            // ),Column(
            
            Padding(padding: EdgeInsets.all(32),
      child: 
      ObserverFuture<List<ImageModel>, Exception>(
  autoInitialize: true,
  fetchData: store.getPostsFromMobxWidget,
  observableFuture: () => store.imagesUser,
  onData: (_, data) {
  if(data.length == 0){
    return Center(child: Text("Você não criou nenhum post"));
  }
return  ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index){
      var post = data[index];
      // return CachedNetworkImage(
      //                           imageUrl: snapshot.data![index].url!,
      //                           width: 100,
      //                           height: 100,
      //                           fit: BoxFit.cover,
      //                           progressIndicatorBuilder:
      //                               (context, url, downloadProgress) =>
      //                                   CircularProgressIndicator(
      //                                       value: downloadProgress.progress),
      //                           errorWidget: (context, url, error) =>
      //                               const Icon(Icons.error),
      //                         ),
      //                       );
    
  });},
  onNull: (_) => const Text('Nenhum post criado'),
  onError: (_, error) => const Text('Ocorreu um erro ao pesquisar os posts'),
  onPending: (_) => const Center(child: CircularProgressIndicator(color: Colors.blue,),),
  onUnstarted: (_) => const Text(''),
)
    ))
        );
  }
}
