String convertSingleQuoteToDoubleQuote(String string){
  // Convert all the occurrence of single quote into double quote in a string
  // except apostrophes
  String modifiedString = string.replaceAllMapped(
    RegExp(r"(\w*)'(\w*)"),
        (match) {
      String wordBefore = match.group(1)!;
      String wordAfter = match.group(2)!;

      // Check if the single quote is not in a word like "don't"
      if (wordBefore.isEmpty || wordAfter.isEmpty) {
        // print(match.group(0)!);
        return match.group(0)!.replaceAll('\'', '"');
      } else {
        // print('${wordBefore}"${wordAfter}');
        return '$wordBefore\'$wordAfter';
      }
    },
  );
  return modifiedString;
}