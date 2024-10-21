import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

const String base = "http://172.104.96.104/";
const String vocabDetailsEndpoint = "api/vocab_details/";
const String kanjiDetailsEndpoint = "kanji/api/kanji_details/";


Future<List<dynamic>> getVocabDetails(String vocab) async {
  final response = await http.get(
    Uri.parse('$base$vocabDetailsEndpoint$vocab/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    // print(decodedResponse.runtimeType);
    return decodedResponse;
  } else {
    throw Exception('Failed to get details.');
  }
}

Future<dynamic> getKanjiDetails(String kanji) async {
  final response = await http.get(
    Uri.parse('$base$kanjiDetailsEndpoint$kanji/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  );
  // print(response.statusCode);
  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    // print(decodedResponse.runtimeType);
    return decodedResponse;
  } else {
    throw Exception('Failed to get kanji details.');
  }
}