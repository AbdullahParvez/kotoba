import 'package:flutter/material.dart';
import 'package:kotoba/methods/create_question.dart';
import 'package:kotoba/models/vocab.dart';
import 'package:kotoba/screens/result_screen.dart';
import 'package:kotoba/widgets/option_card.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.vocabs, required this.testNo});
  final List<Vocab> vocabs;
  final int testNo;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Color optionOneBorderColor = Colors.grey;
  Color optionTwoBorderColor = Colors.grey;
  Color optionThreeBorderColor = Colors.grey;
  Color optionFourBorderColor = Colors.grey;
  Color optionFiveBorderColor = Colors.grey;
  Color optionSixBorderColor = Colors.grey;
  int qNo = 0;
  List<Map<String, dynamic>> questions = [];
  String question = '';
  String correctAnswer = '';
  List<String> optionList = [];
  String givenAnswer = '';
  bool result = false;
  @override
  void initState() {
    questions = createQuestionDetails(widget.testNo, widget.vocabs);
    // print(questions);
    super.initState();
  }

  void setOptionBackgroundColor({
    Color optionOneColor = Colors.grey,
    Color optionTwoColor = Colors.grey,
    Color optionThreeColor = Colors.grey,
    Color optionFourColor = Colors.grey,
    Color optionFiveColor = Colors.grey,
    Color optionSixColor = Colors.grey,
  }) {
    // print('settings color');
    optionOneBorderColor = optionOneColor;
    optionTwoBorderColor = optionTwoColor;
    optionThreeBorderColor = optionThreeColor;
    optionFourBorderColor = optionFourColor;
    optionFiveBorderColor = optionFiveColor;
    optionSixBorderColor = optionSixColor;
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    question = questions[qNo]['question'];
    correctAnswer = questions[qNo]['correctAnswer'];
    optionList = questions[qNo]['options'];
    // givenAnswer = questions[qNo]['givenAnswer'];

    void onSelectCard(int optionNo, String text) {
      Color cardColor = Colors.blue;
      // if (text == correctAnswer) {
      //   cardColor = Colors.green;
      // } else {
      //   cardColor = Colors.red;
      // }
      // print(widget.vocabs[itemCount].pronunciation);
      setState(() {
        givenAnswer = text;
        // print(givenAnswer);
        // questions[qNo]['givenAnswer'] = text;
        if (optionNo == 1) {
          setOptionBackgroundColor(optionOneColor: cardColor);
        } else if (optionNo == 2) {
          setOptionBackgroundColor(optionTwoColor: cardColor);
        } else if (optionNo == 3) {
          setOptionBackgroundColor(optionThreeColor: cardColor);
        } else if (optionNo == 4) {
          setOptionBackgroundColor(optionFourColor: cardColor);
        } else if (optionNo == 5) {
          setOptionBackgroundColor(optionFiveColor: cardColor);
        } else if (optionNo == 6) {
          setOptionBackgroundColor(optionSixColor: cardColor);
        }
      });
    }

    Widget getResultOrQuesWidget() {
      if (result) {
        return ResultScreen(
          questions: questions,
        );
      } else {
        return getQuestionWidget(screen, onSelectCard);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Model test ${widget.testNo.toString()}'),
      ),
      body: getResultOrQuesWidget(),
    );
  }

  Padding getQuestionWidget(
      Size screen, void Function(int optionNo, String text) onSelectCard) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.orange[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: screen.height * .20,
              child: Row(
                children: [
                  SizedBox(
                    width: screen.width * .9,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          question,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screen.height * .17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OptionCard(
                  screen: screen,
                  option: optionList[0],
                  borderColor: optionOneBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 1,
                ),
                // SizedBox(
                //   width: screen.width * 0.02,
                // ),
                OptionCard(
                  screen: screen,
                  option: optionList[1],
                  borderColor: optionTwoBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * .17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OptionCard(
                  screen: screen,
                  option: optionList[2],
                  borderColor: optionThreeBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 3,
                ),
                // SizedBox(
                //   width: screen.width * 0.02,
                // ),
                OptionCard(
                  screen: screen,
                  option: optionList[3],
                  borderColor: optionFourBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 4,
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * .17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OptionCard(
                  screen: screen,
                  option: optionList[4],
                  borderColor: optionFiveBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 5,
                ),
                // SizedBox(
                //   width: screen.width * 0.02,
                // ),
                OptionCard(
                  screen: screen,
                  option: optionList[5],
                  borderColor: optionSixBorderColor,
                  onSelectCard: onSelectCard,
                  optionNo: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * 0.06,
            child: ElevatedButton.icon(
              onPressed: () {
                if (qNo >= questions.length - 1) {
                  setState(() {
                    questions[qNo]['givenAnswer'] = givenAnswer;
                    result = true;
                  });
                } else {
                  setState(() {
                    questions[qNo]['givenAnswer'] = givenAnswer;
                    qNo++;
                    setOptionBackgroundColor();
                  });
                }
              },
              icon: const Icon(
                Icons.done_all,
                size: 40.0,
              ),
              label: const Text(
                'Select',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
