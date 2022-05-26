import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persefone/pages/profile%20page/models/image_model.dart';

import '../../../core/models/user_model.dart';

class ImageRepository {
  var bd = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<List<ImageModel>> getUserImages() async {
    List<ImageModel> postsUser = [];
    var postsBd = await bd
        .collection('users')
        .doc(currentUser!.uid)
        .collection('images')
        .get();
    for (var post in postsBd.docs) {
      var postAdd = ImageModel(post.id, post['owner_id'], post['url']);
      postsUser.add(postAdd);
    }
    return postsUser;
  }

  Future<List<ImageModel>> getAllImages() async {
    List<ImageModel> postsUser = [];
    var postUser = await bd
        .collection('users')
        .doc(currentUser!.uid)
        .collection('images')
        .get();
    var postsBd = await bd.collection('images').get();
    for (var post in postsBd.docs) {
      for (var imageUser in postUser.docs) {
        if (post.id != imageUser.id) {
          var postAdd = ImageModel(post.id, post['owner_id'], post['url']);
          postsUser.add(postAdd);
        }
      }
    }
    return postsUser;
  }
}
