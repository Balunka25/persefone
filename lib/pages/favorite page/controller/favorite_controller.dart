import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:persefone/core/generics/resource.dart';
part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  @observable
  Resource favoriteStatus = Resource.loading();

  @observable
  ObservableList favoriteList = [].asObservable();

  @action
  Future<void> getUserFavorites() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("favorites")
          .get();
      
      final results = result.docs.map((e) => e.data()).toList();
      favoriteList.addAll(results.asObservable());
      favoriteStatus = Resource.success();
    } catch (error) {
      favoriteStatus = Resource.failed();
    }
  }



  
}
