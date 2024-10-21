import 'dart:math';

import '../models/vocab.dart';

List<Map<String, dynamic>> createQuestionDetails(int qNo, List<Vocab> vocabList){
  List<Map<String, dynamic>> questionDetails=[];
  int startingIndex = 0;
  if(qNo==2 || qNo==4 || qNo==6 || qNo==8){
    startingIndex = 1;
  }

  for (int i=startingIndex; i<vocabList.length; i+=2){
    Map<String, dynamic> quesDet={};
    String question = '';
    String correctAnswer='';
    List<String >optionList = [];
    Set<int> options = {i};
    while (options.length < 6) {
      options.add(Random().nextInt(20));
    }

    if ([1,2].contains(qNo)){
      question = vocabList[i].word;
      correctAnswer = vocabList[i].pronunciation;
      for (int s in options){
        optionList.add(vocabList[s].pronunciation);
      }
    } else if ([3,4].contains(qNo)){
      question = vocabList[i].pronunciation;
      correctAnswer = vocabList[i].word;
      for (int s in options){
        optionList.add(vocabList[s].word);
      }
    }else if ([5,6].contains(qNo)){
      question = vocabList[i].word;
      correctAnswer = vocabList[i].meaning;
      for (int s in options){
        optionList.add(vocabList[s].meaning);
      }
    }else if ([7,8].contains(qNo)){
      question = vocabList[i].meaning;
      correctAnswer = vocabList[i].word;
      for (int s in options){
        optionList.add(vocabList[s].word);
      }
    }
    quesDet['question'] = question;
    quesDet['correctAnswer'] = correctAnswer;
    optionList.shuffle();
    quesDet['options'] = optionList;
    quesDet['givenAnswer'] = '';
    questionDetails.add(quesDet);
  }
  // print(questionDetails.length);
  return questionDetails;
}
