import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/database/firebase_crud.dart';
import 'package:firebase_demo/view/add_edit_emp.dart';
import 'package:flutter/material.dart';

import '../model/emp_model.dart';

class GetEmp extends StatefulWidget {
  const GetEmp({super.key});

  @override
  State<GetEmp> createState() => _GetEmpState();
}

class _GetEmpState extends State<GetEmp> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.getEmp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Employee"),
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e['emp_name']}"),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text("${e['contact_no']}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text("${e['position']}"),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AddEditEmp(
                                      isEdited: true,
                                      employee: EmployeeModel(
                                        uid: e.id,
                                        empName: e["emp_name"],
                                        empPosition: e["position"],
                                        empContact: e["contact_no"],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: IconButton(
                                onPressed: () async {
                                  var response =
                                      await FirebaseCrud.deleteEmp(docId: e.id);
                                  if (response.code != 200) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                response.message.toString()),
                                          );
                                        });
                                  }
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AddEditEmp(),
            ),
          );
        },
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        tooltip: "Add Todo",
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
