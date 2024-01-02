import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/response_model.dart';

final FirebaseFirestore _fireStore =  FirebaseFirestore.instance;
final CollectionReference _collection = _fireStore.collection('Employee');

class FirebaseCrud{
  //CRUD method here

 /* static Future<Response> addEmp()async{

    Response response=Response();
    DocumentReference documentReference=_collection.doc();

    Map<String,dynamic> data= <String,dynamic>{
      ""
    }



  }*/
}