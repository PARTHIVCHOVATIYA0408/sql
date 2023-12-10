import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sql/sql/controller/home_controller.dart';
import 'package:sql/sql/model/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "HomeScreen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.gotoAddDataScreen();
              setState(() {
                controller.noteList = controller.dbHelper.getNotesList();
              });
            },
            elevation: 0,
            highlightElevation: 0,
            child: Icon(LucideIcons.plus),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: FutureBuilder(
                future: controller.noteList,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView.separated(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            NoteModel note = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                controller.onEditNote(note);
                              },
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) =>
                                    controller.onDeleteNote(note),
                                background: Container(
                                  color: Colors.redAccent,
                                  child: Icon(
                                    LucideIcons.trash2,
                                    color: Colors.white,
                                  ),
                                ),
                                key: UniqueKey(),
                                // key: ValueKey<int>(note.id!),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  color: Colors.greenAccent.withAlpha(40),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(4),
                                        child: Text(snapshot.data![index].id
                                            .toString()),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Title : ${note.title}"),
                                            Text(
                                                "Description : ${note.description}"),
                                            Text("Email : ${note.email}"),
                                            Text("Age : ${note.age}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16,
                            );
                          },
                        )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
