// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteController on _FavoriteControllerBase, Store {
  late final _$favoriteStatusAtom =
      Atom(name: '_FavoriteControllerBase.favoriteStatus', context: context);

  @override
  Resource<dynamic, dynamic> get favoriteStatus {
    _$favoriteStatusAtom.reportRead();
    return super.favoriteStatus;
  }

  @override
  set favoriteStatus(Resource<dynamic, dynamic> value) {
    _$favoriteStatusAtom.reportWrite(value, super.favoriteStatus, () {
      super.favoriteStatus = value;
    });
  }

  late final _$favoriteListAtom =
      Atom(name: '_FavoriteControllerBase.favoriteList', context: context);

  @override
  ObservableList<dynamic> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(ObservableList<dynamic> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  late final _$getUserFavoritesAsyncAction =
      AsyncAction('_FavoriteControllerBase.getUserFavorites', context: context);

  @override
  Future<void> getUserFavorites() {
    return _$getUserFavoritesAsyncAction.run(() => super.getUserFavorites());
  }

  late final _$removeFavoritesAsyncAction =
      AsyncAction('_FavoriteControllerBase.removeFavorites', context: context);

  @override
  Future<void> removeFavorites(String id) {
    return _$removeFavoritesAsyncAction.run(() => super.removeFavorites(id));
  }

  @override
  String toString() {
    return '''
favoriteStatus: ${favoriteStatus},
favoriteList: ${favoriteList}
    ''';
  }
}
