// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mobx/mobx.dart';

// import '../../upload image/view/models/image_model.dart';
// part 'profile_page_controller.g.dart';

// class ProfilePageController = _ProfilePageControllerBase
//     with _$ProfilePageController;

// abstract class _ProfilePageControllerBase with Store {
//   // @observable
//   // List<ImageModel> imageList = [
//   //   ImageModel()
//   // ];
//   @observable
//   Future<List<ImageModel>> getImagesList(
//   ) async {
//     final QuerySnapshot<Map<String, dynamic>> postCollection =
//         await FirebaseFirestore.instance.collection("images").get();
//     final images = postCollection.docs
//         .map((e) => _ImageModelBase.fromJson(e.data()))
//         .toList();
//   }
// }
