import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sql/sql/model/db_helper.dart';
import 'package:sql/sql/model/note_model.dart';

class DataAddController extends GetxController {
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

  void onAdd() {
    dbHelper!
        .insert(
      NoteModel(
        title: titleTE.text,
        description: descriptionTE.text,
        age: ageTE.text.compareTo(ageTE.toString()),
        email: emailTE.text,
      ),
    )
        .then((value) {
      Get.back(result: true);
    }).onError((error, stackTrace) {
      Get.back(result: false);
    });
  }
}
