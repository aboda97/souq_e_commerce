
abstract class FireDataBaseService{
  Future<void> addData({required String path,required Map<String, dynamic> jsonData,String? docId});
  Future<Map<String, dynamic>> getUserData({required String path,required String docId});
  Future<bool> checkIfUserExist({required String path,required String docId});
}
