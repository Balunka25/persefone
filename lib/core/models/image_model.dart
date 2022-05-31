class ImageModel {
  String id;
  String ownerId;
  String url;
  ImageModel(this.id, this.ownerId, this.url);
}

class ImageModelExplorer extends ImageModel {

  bool isFavorite;
  ImageModelExplorer(String id, String ownerId, String url, this.isFavorite) : super(id, ownerId, url);

}