import 'package:flutter/material.dart';

class TextFormFieldControllers {
  static TextEditingController emailLoginController = TextEditingController();
  static TextEditingController passwordLoginController =
      TextEditingController();

  static TextEditingController emailSignUpController = TextEditingController();
  static TextEditingController passwordSignUpController =
      TextEditingController();
  static TextEditingController passwordConfirmSignUpController =
      TextEditingController();
  static TextEditingController firstNameSignUpController =
      TextEditingController();
  static TextEditingController lastNameSignUpController =
      TextEditingController();
  static TextEditingController homeSearchController = TextEditingController();
  static TextEditingController forumsSearchController = TextEditingController();
  static TextEditingController titlePostController = TextEditingController();
  static TextEditingController descriptionPostController =
      TextEditingController();
  static TextEditingController changeNameController = TextEditingController();
  static TextEditingController changeEmailController = TextEditingController();
}

class TabBarController {
  static TabController? tabController;
  static TabController? tabControllerWeb;
}
