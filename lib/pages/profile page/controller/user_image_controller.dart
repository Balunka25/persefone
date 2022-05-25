import 'package:mobx/mobx.dart';
import '../get_image/image_repository.dart';
import '../models/image_model.dart';
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

}