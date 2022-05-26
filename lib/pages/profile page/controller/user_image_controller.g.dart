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
imagesUser: ${imagesUser}
    ''';
  }
}
