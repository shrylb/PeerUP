import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> editFlashcardSet(
    String documentId, Map<String, dynamic> updatedData) async {
  try {
    await FirebaseFirestore.instance
        .collection('flashcardSets')
        .doc(documentId)
        .update(updatedData)
        .then((_) => print("Document successfully updated"))
        .catchError((error) => print("Error updating document: $error"));
  } catch (e) {
    print(e.toString());
  }
}
