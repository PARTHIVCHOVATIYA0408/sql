import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql/sql/model/db_helper.dart';
import 'package:sql/sql/model/note_model.dart';

class DataEditController extends GetxController {
  DBHelper? dbHelper;

  final NoteModel noteModel;

  late TextEditingController titleTE, ageTE, descriptionTE, emailTE;

  DataEditController(this.noteModel);

  @override
  void onInit() {
    titleTE = TextEditingController();
    ageTE = TextEditingController();
    descriptionTE = TextEditingController();
    emailTE = TextEditingController();
    dbHelper = DBHelper();
    titleTE.text = noteModel.title;
    emailTE.text = noteModel.email;
    descriptionTE.text = noteModel.description;
    ageTE.text = noteModel.age.toString();
    super.onInit();
  }

  void onUpdateData() {
    dbHelper!
        .update(
      NoteModel(
          id: noteModel.id,
          title: titleTE.text,
          description: descriptionTE.text,
          age: ageTE.text.compareTo(ageTE.toString()),
          email: emailTE.text),
    )
        .then((value) {
      Get.back(result: true);
    }).onError((error, stackTrace) {
      Get.back(result: false);
    });
  }
}
