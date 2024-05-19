import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream<QuerySnapshot<Map<String, dynamic>>> fetchFlashcards(flashcardSetId) {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Reference to the 'users' collection with the user's UID as the document ID
      Stream<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('flashcardSets')
              .doc(flashcardSetId)
              .collection('flashcards')
              .snapshots();

      return querySnapshot;
    } else {
      return throw Exception('User is not logged in');
    }
  } catch (e) {
    print('Error fetching data: $e');
    return throw Exception('Error fetching data');
  }
}
