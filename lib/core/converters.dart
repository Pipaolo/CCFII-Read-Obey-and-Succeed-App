const Map<String, int> superScriptCharCodes = {
  '0': 0x2070,
  '1': 0x00B9,
  '2': 0x00B2,
  '3': 0x00B3,
  '4': 0x2074,
  '5': 0x2075,
  '6': 0x2076,
  '7': 0x2077,
  '8': 0x2078,
  '9': 0x2079,
};

String convertVerseNumberToSuperScript(
  int verseNumber,
) {
  //Convert the verse number to strings
  //After converting then turn it into a list
  final verseString = verseNumber.toString();
  final verseSplitted = verseString.split('');
  final convertedVerseString = verseSplitted
      .map((e) => String.fromCharCode(superScriptCharCodes[e]))
      .toList()
      .join();
  return '$convertedVerseString ';
}
