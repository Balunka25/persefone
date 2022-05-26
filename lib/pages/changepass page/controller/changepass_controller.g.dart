// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changepass_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePassController on _ChangePassControllerBase, Store {
  Computed<bool>? _$isPasswordConfirmationValidComputed;

  @override
  bool get isPasswordConfirmationValid =>
      (_$isPasswordConfirmationValidComputed ??= Computed<bool>(
              () => super.isPasswordConfirmationValid,
              name: '_ChangePassControllerBase.isPasswordConfirmationValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_ChangePassControllerBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_ChangePassControllerBase.isConfirmPasswordValid'))
      .value;
  Computed<bool>? _$areCredentialsValidComputed;

  @override
  bool get areCredentialsValid => (_$areCredentialsValidComputed ??=
          Computed<bool>(() => super.areCredentialsValid,
              name: '_ChangePassControllerBase.areCredentialsValid'))
      .value;

  late final _$passwordAtom =
      Atom(name: '_ChangePassControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmpasswordAtom =
      Atom(name: '_ChangePassControllerBase.confirmpassword', context: context);

  @override
  String get confirmpassword {
    _$confirmpasswordAtom.reportRead();
    return super.confirmpassword;
  }

  @override
  set confirmpassword(String value) {
    _$confirmpasswordAtom.reportWrite(value, super.confirmpassword, () {
      super.confirmpassword = value;
    });
  }

  late final _$isPasswordVisibleAtom = Atom(
      name: '_ChangePassControllerBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$isConfirmPasswordVisibleAtom = Atom(
      name: '_ChangePassControllerBase.isConfirmPasswordVisible',
      context: context);

  @override
  bool get isConfirmPasswordVisible {
    _$isConfirmPasswordVisibleAtom.reportRead();
    return super.isConfirmPasswordVisible;
  }

  @override
  set isConfirmPasswordVisible(bool value) {
    _$isConfirmPasswordVisibleAtom
        .reportWrite(value, super.isConfirmPasswordVisible, () {
      super.isConfirmPasswordVisible = value;
    });
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ChangePassControllerBase.resetPassword', context: context);

  @override
  Future<dynamic> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  late final _$_ChangePassControllerBaseActionController =
      ActionController(name: '_ChangePassControllerBase', context: context);

  @override
  void changePassword(String newValue) {
    final _$actionInfo = _$_ChangePassControllerBaseActionController
        .startAction(name: '_ChangePassControllerBase.changePassword');
    try {
      return super.changePassword(newValue);
    } finally {
      _$_ChangePassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPassword(String newValue) {
    final _$actionInfo = _$_ChangePassControllerBaseActionController
        .startAction(name: '_ChangePassControllerBase.changeConfirmPassword');
    try {
      return super.changeConfirmPassword(newValue);
    } finally {
      _$_ChangePassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo =
        _$_ChangePassControllerBaseActionController.startAction(
            name: '_ChangePassControllerBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_ChangePassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmPasswordVisibility() {
    final _$actionInfo =
        _$_ChangePassControllerBaseActionController.startAction(
            name: '_ChangePassControllerBase.changeConfirmPasswordVisibility');
    try {
      return super.changeConfirmPasswordVisibility();
    } finally {
      _$_ChangePassControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
confirmpassword: ${confirmpassword},
isPasswordVisible: ${isPasswordVisible},
isConfirmPasswordVisible: ${isConfirmPasswordVisible},
isPasswordConfirmationValid: ${isPasswordConfirmationValid},
isPasswordValid: ${isPasswordValid},
isConfirmPasswordValid: ${isConfirmPasswordValid},
areCredentialsValid: ${areCredentialsValid}
    ''';
  }
}
