import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/core/services/fire_data_base_service.dart';

class FlutterFireStoreService implements FireDataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> jsonData,
    String? docId,
  }) async {
    try {
      if (docId != null) {
        firestore.collection(path).doc(docId).set(jsonData);  
      }else{
        await firestore.collection(path).add(jsonData);
      }
    } on Exception catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Map<String, dynamic>> getUserData({required String path, required String docId}) async{
    
    var data = await firestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  Future<bool> checkIfUserExist({required String path, required String docId}) async{
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
