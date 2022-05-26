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
  String toString() {
    return '''
allImages: ${allImages}
    ''';
  }
}
