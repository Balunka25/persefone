import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/image_model.dart';
import '../../profile page/get_image/image_repository.dart';
part 'user_page_controller.g.dart';

class UserPageController = _UserPageControllerBase with _$UserPageController;

abstract class _UserPageControllerBase with Store {
  var imageRepository = ImageRepository();

  @observable
  String ownerId = '';

  @action
  Future<String> changeOwnerId(String newValue) async => ownerId = newValue;
  
  @observable
  ObservableFuture<List<ImageModel>>? imagesUser;

  @action
  getImages() {
    imagesUser =
        ObservableFuture(imageRepository.getClickedOnUserImages(ownerId));
  }

  void getPostsFromMobxWidget() {
    imagesUser =
        ObservableFuture(imageRepository.getClickedOnUserImages(ownerId));
  }

  @observable
  int totalImages = 0;

  Future<void> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(ownerId)
        .collection("images")
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    totalImages = _myDocCount.length;
  }

  @observable
  String username = '';

  @action
  Future<void> getUsername() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(ownerId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      username = data['name'];
    });
  }

  @observable
  String userPhone = '';

  @action
  Future<void> getUserPhone() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(ownerId);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
      userPhone = data['phone'];
    });
  }
}
