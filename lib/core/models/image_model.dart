class ImageModel {
  String id;
  String owner_id;
  String url;
  ImageModel(this.id, this.owner_id, this.url);
}

class ImageModelExplorer extends ImageModel {

  bool isFavorite;
  ImageModelExplorer(String id, String owner_id, String url, this.isFavorite) : super(id,owner_id, url);

}