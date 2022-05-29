import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../get_image/image_repository.dart';
import '../../../core/models/image_model.dart';
part 'user_image_controller.g.dart';

class UserImageController = _UserImageControllerBase with _$UserImageController;

abstract class _UserImageControllerBase with Store {
var imageRepository = ImageRepository();

  @observable
  ObservableFuture<List<ImageModel>>? imagesUser;

  @action
  getImages(){
    imagesUser = ObservableFuture(imageRepository.getUserImages());
  }

  void getPostsFromMobxWidget(){
    imagesUser = ObservableFuture(imageRepository.getUserImages());
  }

  @observable 
  String userEmail = '';

  @action
  Future<void> getEmail() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
        userEmail = data['email'];
      });
    }

    @observable
    String userName = '';

    @action
    Future<void> getUserName() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    final DocumentReference document =
        FirebaseFirestore.instance.collection("users").doc(currentUser!.uid);
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
        userName = data['name'];
      });
    }

    @observable
    int totalImages = 0;

    Future<void> countDocuments() async {
    QuerySnapshot _myDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("images")
        .get();
    List<DocumentSnapshot> _myDocCount = _myDoc.docs;
    totalImages = _myDocCount.length;
  }
  }