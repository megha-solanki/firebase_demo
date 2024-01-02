import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/response_model.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
final CollectionReference _collection = _fireStore.collection('Employee');

class FirebaseCrud {
  //CRUD method here

  //add employee data
  static Future<Response> addEmp(
      {required String name,
      required String position,
      required String contact}) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "contact_no": contact,
      "emp_name": name,
      "position": position,
    };

    var result = await documentReference.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }

  //read or get employee data
  static Stream<QuerySnapshot> getEmp() {
    CollectionReference notesItemCollection = _collection;
    return notesItemCollection.snapshots();
  }

  //update employee data
  static Future<Response> updateEmp(
      {required String name,
      required String position,
      required String contact,
      required String docId}) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "contact_no": contact,
      "emp_name": name,
      "position": position,
    };

    await documentReference.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }

  //Delete employee data
  static Future<Response> deleteEmployee({required String docId}) async {
    Response response = Response();
    DocumentReference documentReference = _collection.doc(docId);

    await documentReference.delete().whenComplete(() {
      response.code = 200;
      response.message = "Successfully deleted employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }
}
