import 'package:flutter/material.dart';

class EditEmp extends StatefulWidget {
  const EditEmp({super.key});

  @override
  State<EditEmp> createState() => _EditEmpState();
}

class _EditEmpState extends State<EditEmp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Edit Employee"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
