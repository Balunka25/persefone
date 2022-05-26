import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import '../../profile page/get_image/image_repository.dart';
import '../../profile page/models/image_model.dart';
part 'all_images_controller.g.dart';

class AllImagesController = _AllImagesControllerBase with _$AllImagesController;

abstract class _AllImagesControllerBase with Store {
  var imageRepository = ImageRepository();

  @observable
  ObservableFuture<List<ImageModel>>? allImages;

  @action
  getAllImages() {
    allImages = ObservableFuture(imageRepository.getAllImages());
  }

  void getPostsFromMobxWidget() {
    allImages = ObservableFuture(imageRepository.getAllImages());
  }
}
