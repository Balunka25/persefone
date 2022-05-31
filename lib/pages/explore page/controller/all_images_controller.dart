import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../../profile page/get_image/image_repository.dart';
import '../../../core/models/image_model.dart';
part 'all_images_controller.g.dart';

class AllImagesController = _AllImagesControllerBase with _$AllImagesController;

abstract class _AllImagesControllerBase with Store {
  var imageRepository = ImageRepository();

  @action
  Future<void> manageFavorite(ImageModelExplorer image) async {
    final imageMap = {
      'id': image.id,
      'owner_id': image.ownerId,
      'url': image.url
    };

    if(image.isFavorite == true) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .doc(image.id)
          .delete();
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .doc(image.id)
          .set(imageMap);
    }
  }

  @observable
  ObservableFuture<List<ImageModel>>? allImages;

  @observable
  ObservableFuture<List<ImageModelExplorer>>? allImagesExplorer;

  @action
  getAllImages() {
    allImages = ObservableFuture(imageRepository.getAllImages());
  }

  @action
  Future<List<ImageModelExplorer>> getFavorite() async {
    List<ImageModelExplorer> imagesExplorer = [];

    final images = await imageRepository.getAllImages();
    final userFavorites = await imageRepository.getUserFavorites();
    
    for(var image in images) {
      bool imageFavorite = false;

      for(var favorite in userFavorites) {

        if(image.id == favorite.id) {
          imageFavorite = true;
        }

      }

      ImageModelExplorer newImage = ImageModelExplorer(image.id, image.ownerId, image.url, imageFavorite);
      imagesExplorer.add(newImage);

    }

    return imagesExplorer;
  }

  void getPostsFromMobxWidget() {

    allImagesExplorer = ObservableFuture(getFavorite());

  }

  @observable
  int totalImagesUser = 0;

  @action
  Future<void> getUserImagesCount() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot _userImages = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .collection("images")
        .get();
    List<DocumentSnapshot> _userImagesCount = _userImages.docs;
    totalImagesUser = _userImagesCount.length;
  }

  @observable
  int totalImages = 0;

  @action
  Future<void> getTotalImagesCount() async {
    QuerySnapshot _totalImages =
        await FirebaseFirestore.instance.collection("images").get();
    List<DocumentSnapshot> _totalImagesCount = _totalImages.docs;
    totalImages = _totalImagesCount.length;
  }

  @observable
  int imagesCount = 0;

  @action
  getImagesCount() {
    imagesCount = totalImages - totalImagesUser;
  }
}
