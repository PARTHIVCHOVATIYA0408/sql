import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sql/helper/extention/extensions.dart';
import 'package:sql/sql/model/db_helper.dart';
import 'package:sql/sql/model/note_model.dart';

class DataAddController extends GetxController {
  final formKey = GlobalKey<FormState>();
  DBHelper? dbHelper;

  late TextEditingController titleTE, ageTE, descriptionTE, emailTE;

  @override
  void onInit() {
    titleTE = TextEditingController();
    ageTE = TextEditingController();
    descriptionTE = TextEditingController();
    emailTE = TextEditingController();
    dbHelper = DBHelper();

    super.onInit();
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a title';
    } else if (value.length < 2) {
      return 'Name must be at least 2 characters';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a title';
    } else if (value.length < 2) {
      return 'Name must be at least 2 characters';
    } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0 || age >= 60) {
      return 'Please enter a valid age';
    }
    return null;
  }

  void onAdd() {
    if (formKey.currentState!.validate()) {
      dbHelper!
          .insert(NoteModel(
        title: titleTE.text,
        description: descriptionTE.text,
        age: ageTE.text.toInt(),
        email: emailTE.text,
      ))
          .then((value) {
        Get.back(result: true);
      }).onError((error, stackTrace) {
        Get.back(result: false);
      });
    }
  }
}
