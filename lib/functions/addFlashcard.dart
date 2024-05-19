import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addFlashcard(
  flashcardSetId,
  question,
  answer,
) async {
  try {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid != null) {
      CollectionReference flashcardsCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('flashcardSets')
          .doc(flashcardSetId)
          .collection('flashcards');

      // Data to be added to the collection
      Map<String, dynamic> flashcardData = {
        'question': question,
        'answer': answer,
        // Add other user data here
      };

      // Add the data to the collection
      await flashcardsCollection.add(flashcardData);

      print('User data added to Firestore collection successfully!');
    } else {
      print('User is not authenticated.');
    }
  } catch (e) {
    print('Error adding user data to Firestore collection: $e');
  }
}
