// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_images_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllImagesController on _AllImagesControllerBase, Store {
  late final _$allImagesAtom =
      Atom(name: '_AllImagesControllerBase.allImages', context: context);

  @override
  ObservableFuture<List<ImageModel>>? get allImages {
    _$allImagesAtom.reportRead();
    return super.allImages;
  }

  @override
  set allImages(ObservableFuture<List<ImageModel>>? value) {
    _$allImagesAtom.reportWrite(value, super.allImages, () {
      super.allImages = value;
    });
  }

  late final _$totalImagesUserAtom =
      Atom(name: '_AllImagesControllerBase.totalImagesUser', context: context);

  @override
  int get totalImagesUser {
    _$totalImagesUserAtom.reportRead();
    return super.totalImagesUser;
  }

  @override
  set totalImagesUser(int value) {
    _$totalImagesUserAtom.reportWrite(value, super.totalImagesUser, () {
      super.totalImagesUser = value;
    });
  }

  late final _$totalImagesAtom =
      Atom(name: '_AllImagesControllerBase.totalImages', context: context);

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

  late final _$imagesCountAtom =
      Atom(name: '_AllImagesControllerBase.imagesCount', context: context);

  @override
  int get imagesCount {
    _$imagesCountAtom.reportRead();
    return super.imagesCount;
  }

  @override
  set imagesCount(int value) {
    _$imagesCountAtom.reportWrite(value, super.imagesCount, () {
      super.imagesCount = value;
    });
  }

  late final _$getUserImagesCountAsyncAction = AsyncAction(
      '_AllImagesControllerBase.getUserImagesCount',
      context: context);

  @override
  Future<void> getUserImagesCount() {
    return _$getUserImagesCountAsyncAction
        .run(() => super.getUserImagesCount());
  }

  late final _$getTotalImagesCountAsyncAction = AsyncAction(
      '_AllImagesControllerBase.getTotalImagesCount',
      context: context);

  @override
  Future<void> getTotalImagesCount() {
    return _$getTotalImagesCountAsyncAction
        .run(() => super.getTotalImagesCount());
  }

  late final _$_AllImagesControllerBaseActionController =
      ActionController(name: '_AllImagesControllerBase', context: context);

  @override
  dynamic getAllImages() {
    final _$actionInfo = _$_AllImagesControllerBaseActionController.startAction(
        name: '_AllImagesControllerBase.getAllImages');
    try {
      return super.getAllImages();
    } finally {
      _$_AllImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getImagesCount() {
    final _$actionInfo = _$_AllImagesControllerBaseActionController.startAction(
        name: '_AllImagesControllerBase.getImagesCount');
    try {
      return super.getImagesCount();
    } finally {
      _$_AllImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allImages: ${allImages},
totalImagesUser: ${totalImagesUser},
totalImages: ${totalImages},
imagesCount: ${imagesCount}
    ''';
  }
}
