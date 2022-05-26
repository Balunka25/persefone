// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_image_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserImageController on _UserImageControllerBase, Store {
  late final _$imagesUserAtom =
      Atom(name: '_UserImageControllerBase.imagesUser', context: context);

  @override
  ObservableFuture<List<ImageModel>>? get imagesUser {
    _$imagesUserAtom.reportRead();
    return super.imagesUser;
  }

  @override
  set imagesUser(ObservableFuture<List<ImageModel>>? value) {
    _$imagesUserAtom.reportWrite(value, super.imagesUser, () {
      super.imagesUser = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_UserImageControllerBase.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_UserImageControllerBase.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$totalImagesAtom =
      Atom(name: '_UserImageControllerBase.totalImages', context: context);

  @override
  int get totalImages {
    _$totalImagesAtom.reportRead();
    return super.totalImages;
  }

  @override
  set totalImages(int value) {
    _$totalImagesAtom.reportWrite(value, super.totalImages, () {
      super.totalImages = value;
    });
  }

  late final _$getEmailAsyncAction =
      AsyncAction('_UserImageControllerBase.getEmail', context: context);

  @override
  Future<void> getEmail() {
    return _$getEmailAsyncAction.run(() => super.getEmail());
  }

  late final _$getUserNameAsyncAction =
      AsyncAction('_UserImageControllerBase.getUserName', context: context);

  @override
  Future<void> getUserName() {
    return _$getUserNameAsyncAction.run(() => super.getUserName());
  }

  late final _$_UserImageControllerBaseActionController =
      ActionController(name: '_UserImageControllerBase', context: context);

  @override
  dynamic getImages() {
    final _$actionInfo = _$_UserImageControllerBaseActionController.startAction(
        name: '_UserImageControllerBase.getImages');
    try {
      return super.getImages();
    } finally {
      _$_UserImageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imagesUser: ${imagesUser},
userEmail: ${userEmail},
userName: ${userName},
totalImages: ${totalImages}
    ''';
  }
}
