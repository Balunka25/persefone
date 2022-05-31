// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserPageController on _UserPageControllerBase, Store {
  late final _$ownerIdAtom =
      Atom(name: '_UserPageControllerBase.ownerId', context: context);

  @override
  String get ownerId {
    _$ownerIdAtom.reportRead();
    return super.ownerId;
  }

  @override
  set ownerId(String value) {
    _$ownerIdAtom.reportWrite(value, super.ownerId, () {
      super.ownerId = value;
    });
  }

  late final _$imagesUserAtom =
      Atom(name: '_UserPageControllerBase.imagesUser', context: context);

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

  late final _$totalImagesAtom =
      Atom(name: '_UserPageControllerBase.totalImages', context: context);

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

  late final _$usernameAtom =
      Atom(name: '_UserPageControllerBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$userPhoneAtom =
      Atom(name: '_UserPageControllerBase.userPhone', context: context);

  @override
  String get userPhone {
    _$userPhoneAtom.reportRead();
    return super.userPhone;
  }

  @override
  set userPhone(String value) {
    _$userPhoneAtom.reportWrite(value, super.userPhone, () {
      super.userPhone = value;
    });
  }

  late final _$changeOwnerIdAsyncAction =
      AsyncAction('_UserPageControllerBase.changeOwnerId', context: context);

  @override
  Future<String> changeOwnerId(String newValue) {
    return _$changeOwnerIdAsyncAction.run(() => super.changeOwnerId(newValue));
  }

  late final _$getUsernameAsyncAction =
      AsyncAction('_UserPageControllerBase.getUsername', context: context);

  @override
  Future<void> getUsername() {
    return _$getUsernameAsyncAction.run(() => super.getUsername());
  }

  late final _$getUserPhoneAsyncAction =
      AsyncAction('_UserPageControllerBase.getUserPhone', context: context);

  @override
  Future<void> getUserPhone() {
    return _$getUserPhoneAsyncAction.run(() => super.getUserPhone());
  }

  late final _$_UserPageControllerBaseActionController =
      ActionController(name: '_UserPageControllerBase', context: context);

  @override
  dynamic getImages() {
    final _$actionInfo = _$_UserPageControllerBaseActionController.startAction(
        name: '_UserPageControllerBase.getImages');
    try {
      return super.getImages();
    } finally {
      _$_UserPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ownerId: ${ownerId},
imagesUser: ${imagesUser},
totalImages: ${totalImages},
username: ${username},
userPhone: ${userPhone}
    ''';
  }
}
