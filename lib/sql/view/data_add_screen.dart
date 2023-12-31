import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sql/sql/controller/data_add_controller.dart';

class DataAddScreen extends StatefulWidget {
  const DataAddScreen({super.key});

  @override
  State<DataAddScreen> createState() => _DataAddScreenState();
}

class _DataAddScreenState extends State<DataAddScreen> {
  late DataAddController controller;

  @override
  void initState() {
    controller = DataAddController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      tag: 'data_add_controller',
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Data Add Screen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: controller.titleTE,
                        validator: controller.validateTitle,
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
                        validator: controller.validateDescription,
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
                        validator: controller.validateEmail,
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
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.ageTE,
                        validator: controller.validateAge,
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
                        onTap: controller.onAdd,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LucideIcons.plus,
                                size: 20,
                              ),
                              Text(
                                "Add Data",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
