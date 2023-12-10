import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql/sql/controller/data_edit_controller.dart';
import 'package:sql/sql/model/note_model.dart';

class DataEditScreen extends StatefulWidget {
  final NoteModel noteModel;

  const DataEditScreen({super.key, required this.noteModel});

  @override
  State<DataEditScreen> createState() => _DataEditScreenState();
}

class _DataEditScreenState extends State<DataEditScreen> {
  late DataEditController controller;

  @override
  void initState() {
    controller = DataEditController(widget.noteModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.titleTE,
                      decoration: InputDecoration(
                        hintText: "Enter title",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: controller.descriptionTE,
                      decoration: InputDecoration(
                        hintText: "Enter Description",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: controller.emailTE,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: controller.ageTE,
                      decoration: InputDecoration(
                        hintText: "Enter age",
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: controller.onUpdateData,
                      child: const Text(
                        "Update Data",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
