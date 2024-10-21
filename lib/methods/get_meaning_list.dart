import 'package:kotoba/models/details_card_item.dart';


List<CardItem> getMeaningList(details) {
  List<CardItem> items = [];

  for (var data in details) {
    String kEle = data['k_ele'].join(", ");
    String rEle = data['r_ele'].join(", ");
    List<Map<String, dynamic>> senseList = [];
    for (var sen in data ['sense']) {
      Map<String, dynamic> senseMap = {};
      if (sen['pos'].length != 0) {
        senseMap['pos'] = sen['pos'].join(", ");
      } else {
        senseMap['pos'] = '';
      }
      senseMap['meaning'] = sen['meaning'].join(", ");
      if (sen['example'].length > 0) {
        senseMap['ex_text'] = sen['example'][0]['ex_text'];
        senseMap['ex_sent_jpn'] = sen['example'][0]['ex_sent_jpn'];
        senseMap['ex_sent_eng'] = sen['example'][0]['ex_sent_eng'];
      } else {
        senseMap['ex_text'] = '';
        senseMap['ex_sent_jpn'] = '';
        senseMap['ex_sent_eng'] = '';
      }
      senseList.add(senseMap);
    }
    items.add(CardItem(word: kEle, reading: rEle, sense: senseList));
  }
  return items;
}