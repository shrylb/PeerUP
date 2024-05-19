import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:peerup/flashcard/answerCard.dart';
import 'package:peerup/flashcard/flashcard_main.dart';
import 'package:peerup/flashcard/questionCard.dart';
import 'package:peerup/functions/fetchFlashcard.dart';

class PracticeReview extends StatefulWidget {
  final String flashcardSetId;

  const PracticeReview({super.key, required this.flashcardSetId});

  @override
  _PracticeReviewState createState() =>
      _PracticeReviewState(flashcardSetId: flashcardSetId);
}

class _PracticeReviewState extends State<PracticeReview> {
  _PracticeReviewState({required this.flashcardSetId});
  bool isShowingQuestion = true;
  List<String> answeredQuestions = [];

  String _currentFlashcard = '';
  final String flashcardSetId;
  late Stream<QuerySnapshot<Map<String, dynamic>>> flashcards;
  late QuerySnapshot<Map<String, dynamic>> flashcardSnapshot;
  int score = 0;

  @override
  initState() {
    super.initState();
    fetchAndSetFlashcards();
  }

  Future<void> fetchAndSetFlashcards() async {
    flashcards = fetchFlashcards(flashcardSetId);
    await flashcards.first.then((snapshot) {
      // Here you get the first flashcard
      _currentFlashcard = snapshot.docs.first.id;
      flashcardSnapshot = snapshot;
      answeredQuestions.add(_currentFlashcard);
    });
  }

  handleAnswerPress() {
    setState(() {
      isShowingQuestion = true;
    });
  }

  handleQuestionPress() {
    setState(() {
      isShowingQuestion = false;
    });
  }

  handleWrong() {
    handleNextQuestion();
  }

  handleCorrect() {
    handleNextQuestion();
    score += 1;
  }

  handleNextQuestion() async {
    print('handleNextQuestion');

    if (flashcardSnapshot.docs.length == answeredQuestions.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => ReviewCompletePage(
                score: score, totalItems: flashcardSnapshot.docs.length)),
      );
    }

    QueryDocumentSnapshot<Map<String, dynamic>> result = flashcardSnapshot.docs
        .firstWhere((element) => !answeredQuestions.contains(element.id));

    setState(() {
      _currentFlashcard = result.id;
    });
    answeredQuestions.add(result.id);
    isShowingQuestion = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAEBD2),
        appBar: AppBar(
          title: const Text('Practice',
              style: TextStyle(
                  fontFamily: 'Poppins', 
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  )),
          backgroundColor: const Color(0xFFFAEBD2),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: flashcards,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.data?.docs == null) {
              return const Text('No flashcard sets yet');
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Text('No flashcard sets yet');
            }
            print("_currentFlashcard ${_currentFlashcard}");
            QueryDocumentSnapshot<Object?>? flashcard =
                snapshot.data?.docs.firstWhere((element) {
              return element.id == _currentFlashcard;
            });
            Map<String, dynamic> flashcardData =
                flashcard?.data() as Map<String, dynamic>;

            if (isShowingQuestion) {
              return QuestionCard(
                  question: flashcardData['question'],
                  onPressed: handleQuestionPress);
            } else {
              return AnswerCard(
                answer: flashcardData['answer'],
                onPressed: handleAnswerPress,
                onCorrect: handleCorrect,
                onWrong: handleWrong,
              );
            }
          },
        ));
  }
}
