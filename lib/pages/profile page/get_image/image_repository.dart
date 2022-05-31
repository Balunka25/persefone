import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:persefone/core/models/image_model.dart';

class ImageRepository {
  var bd = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<List<ImageModel>> getUserImages() async {
    List<ImageModel> postsUser = [];
    var postsBd = await bd.collection('users').doc(currentUser!.uid).collection("images").get();
    final postQuery = postsBd.docs;
    final postDocs= postQuery.map((e) => e.data()).toList();
    postsUser = postDocs.map((map) => ImageModel(map["id"], map["owner_id"], map["url"])).toList();
    return postsUser;
  }

  Future<List<ImageModel>> getAllImages() async {
    List<ImageModel> postsAll = [];
    var postsBd = await bd.collection('images').where("owner_id", isNotEqualTo: currentUser!.uid).get();
    final postQuery = postsBd.docs;
    final postDocs= postQuery.map((e) => e.data()).toList();
    postsAll = postDocs.map((map) => ImageModel(map["id"], map["owner_id"], map["url"])).toList();
    return postsAll;
  }

  Future<List<ImageModel>> getUserFavorites() async {
    List<ImageModel> favoritesUser = [];
    var favorites = await bd.collection('users').doc(currentUser!.uid).collection("favorites").get();
    final result = favorites.docs.map((e) => e.data()).toList();
    favoritesUser = result.map((map) => ImageModel(map["id"], map["owner_id"], map["url"])).toList();
    return favoritesUser;
  }

  Future<List<ImageModel>> getClickedOnUserImages(String ownerId) async {
    List<ImageModel> postsUser = [];
    var postsBd = await bd.collection('users').doc(ownerId).collection("images").get();
    final postQuery = postsBd.docs;
    final postDocs= postQuery.map((e) => e.data()).toList();
    postsUser = postDocs.map((map) => ImageModel(map["id"], map["owner_id"], map["url"])).toList();
    return postsUser;
  }
}