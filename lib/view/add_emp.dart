import 'package:firebase_demo/database/firebase_crud.dart';
import 'package:firebase_demo/widgets/custom_button.dart';
import 'package:firebase_demo/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AddEmp extends StatefulWidget {
  const AddEmp({super.key});

  @override
  State<AddEmp> createState() => _AddEmpState();
}

class _AddEmpState extends State<AddEmp> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPosition = TextEditingController();
  TextEditingController txtContact = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  label: "Name",
                  hintText: "Enter name",
                  controller: txtName,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Employee name is required";
                    }
                  },
                  keyboardType: TextInputType.text),
              const SizedBox(height: 18),
              CustomTextFormField(
                  label: "Position",
                  hintText: "Enter position",
                  controller: txtPosition,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Employee position  is required";
                    }
                  },
                  keyboardType: TextInputType.text),
              const SizedBox(height: 18),
              CustomTextFormField(
                  label: "Contact No",
                  hintText: "Enter contact no",
                  controller: txtContact,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Employee contact number is required";
                    }
                  },
                  keyboardType: TextInputType.number),
              const SizedBox(height: 40),
              CustomButton(
                label: "Save",
                isLoading: false,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var response = await FirebaseCrud.addEmp(
                        name: txtName.text,
                        position: txtPosition.text,
                        contact: txtContact.text);
                    if (response.code != 200) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(response.message.toString()),
                            );
                          });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
