import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:persefone/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  

  @observable
  UserModel user = UserModel();

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
      email.contains("@") && email.contains(".com") && email.isNotEmpty;

  @observable
  String name = '';

  @action
  void changeName(String newValue) => name = newValue;

  @computed
  bool get isNameValid => name.isNotEmpty;


  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @computed
  bool get isPasswordValid => password.length > 7;

  @observable
  String passwordConfirmation = '';

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

  @computed
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @observable
  bool isPasswordVisible = false;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool isPasswordConfirmationVisible = false;

  @action
  void setPasswordConfirmationVisibility() =>
      isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @observable
  bool isButtonAtLoadingState = false;

  @action
  void setButtonToLoadingState() => isButtonAtLoadingState = true;

  @action
  Future <UserCredential> registerUser() async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set(
      {
        "id": userCredential.user!.uid,
        "email": email,
        "name": name,
        "password": password,
      },
    ); 
    return userCredential;
  }

  @computed
  bool get areCredentialsValid =>
      isEmailValid &&
      isNameValid &&
      isPasswordValid &&
      isPasswordConfirmationValid;
}
