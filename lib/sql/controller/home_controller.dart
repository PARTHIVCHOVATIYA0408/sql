import 'package:get/get.dart';
import 'package:sql/helper/theme.dart';
import 'package:sql/helper/theme_type.dart';
import 'package:sql/sql/model/db_helper.dart';
import 'package:sql/sql/model/note_model.dart';
import 'package:sql/sql/view/data_add_screen.dart';
import 'package:sql/sql/view/data_edit_screen.dart';

class HomeController extends GetxController {
  late DBHelper dbHelper;
  Future<List<NoteModel>>? noteList;
  bool isDark = false;

  HomeController() {
    dbHelper = DBHelper();
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() async {
    noteList = dbHelper.getNotesList();
  }

  Future<void> gotoAddDataScreen() async {
    bool? result = await Get.to(const DataAddScreen());
    if (result == true) {
      loadData();
      update();
    }
  }

  Future<void> onEditNote(NoteModel noteModel) async {
    bool? result = await Get.to(DataEditScreen(noteModel: noteModel));
    if (result == true) {
      loadData();
      dbHelper.update(noteModel);
      update();
    }
  }

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      ThemeType.dark;
    } else {
      ThemeType.light;
    }
    update();
  }

  void onDeleteNote(NoteModel model) {
    dbHelper.delete(model.id!);
    loadData();
    update();
  }
}
