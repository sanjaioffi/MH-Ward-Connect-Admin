import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> updateDocument(
  int newStatus,
  String documentId,
) async {
  try {
    await firestore.collection('issues').doc(documentId).update({
      'status': newStatus,
    });

    print('Document updated successfully.');
  } catch (e) {
    print('Error updating document: $e');
  }
}
