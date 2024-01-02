import 'package:firebase_demo/widgets/custom_button.dart';
import 'package:firebase_demo/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AddEmp extends StatefulWidget {
  const AddEmp({super.key});

  @override
  State<AddEmp> createState() => _AddEmpState();
}

class _AddEmpState extends State<AddEmp> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtPosition=TextEditingController();
  TextEditingController txtContact=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomTextFormField(
                label: "Name",
                hintText: "Enter name",
                controller: txtName,
                keyboardType: TextInputType.text),
            const SizedBox(height: 18),
            CustomTextFormField(
                label: "Position",
                hintText: "Enter position",
                controller: txtPosition,
                keyboardType: TextInputType.text),
            const SizedBox(height: 18),
            CustomTextFormField(
                label: "Contact No",
                hintText: "Enter contact no",
                controller: txtContact,
                keyboardType: TextInputType.number),
            const SizedBox(height: 40),
            CustomButton(
              label: "Save",
              isLoading: false,
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
