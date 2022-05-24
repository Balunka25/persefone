// class ImageModel {
//   String? url;
//   String? id;
//   // String? ownerId;

//   ImageModel({
//     this.url,
//     this.id,
//     // this.ownerId
//   });

//   factory ImageModel.fromJson(Map<String, dynamic> map) {
//     return ImageModel(
//       url: map["url"] ?? "",
//       id: map["_id"] ?? "",
//       // ownerId: map["owner_id"] ?? "",
//     );
//   }
// }

import 'package:mobx/mobx.dart';
part 'image_model.g.dart';

class ImageModel = _ImageModelBase with _$ImageModel;

abstract class _ImageModelBase with Store {
  _ImageModelBase({this.url, this.id});

  @observable
  String? url;

  @observable
  String? id;

  // @action
  // setUrl(String newValue) => url = newValue;

  // @action
  // setId(String newValue) => id = newValue;

    factory _ImageModelBase.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      url: map["url"] ?? "",
      id: map["_id"] ?? "",
      // ownerId: map["owner_id"] ?? "",
    );
  }
}
