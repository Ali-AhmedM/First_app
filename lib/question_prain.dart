import 'package:a3uiapp1/question.dart';

class QuestionBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        questionText: '1) Muslims must pray once a day.',
        questionAnswer: false),
    Question(
        questionText: '2) Allah is the name Muslims use for God.',
        questionAnswer: true),
    Question(
        questionText: '3) The holy day of the week in Islam is Sunday.',
        questionAnswer: false),
    Question(
        questionText: '4) Ramadan is the celebration at the end of Eid.',
        questionAnswer: false),
    Question(
        questionText: '5) Islam is a violent religion that promotes terrorism.',
        questionAnswer: false),
    Question(
        questionText: '6) Muslims do not believe in giving to the poor.',
        questionAnswer: false),
    Question(questionText: '7) Islam means peace.', questionAnswer: true),
    Question(
        questionText: '8) Muslims only live in the Middle East.',
        questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }

    print(_questionNumber);
    print(_questionBank.length);
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }
  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.

  void reset() {
    _questionNumber = 0;
  }
}
