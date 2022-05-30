import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'changepass_controller.g.dart';

class ChangePassController = _ChangePassControllerBase
    with _$ChangePassController;

abstract class _ChangePassControllerBase with Store {
  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @observable
  String confirmpassword = '';

  @action
  void changeConfirmPassword(String newValue) => confirmpassword = newValue;

  @observable
  bool isPasswordVisible = false;

  @action
  void changePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isConfirmPasswordVisible = false;

  @action
  void changeConfirmPasswordVisibility() =>
      isConfirmPasswordVisible = !isConfirmPasswordVisible;

  @action
  Future<dynamic> resetPassword() async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(confirmpassword);

      return true;
    } on FirebaseAuthException catch (error) {
      throw error.code;
    }
  }

   @computed
  bool get isPasswordConfirmationValid => confirmpassword == password;

  @computed
  bool get isPasswordValid => password.length > 5;

  @computed
  bool get isConfirmPasswordValid => confirmpassword.length > 5;

  @computed
  bool get areCredentialsValid =>
  isPasswordValid &&
  isConfirmPasswordValid &&
  isPasswordConfirmationValid;
}
