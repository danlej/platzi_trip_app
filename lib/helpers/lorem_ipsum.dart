import 'dart:math';

String loremIpsum(int length) {
  const List<String> words = [
    "lorem",
    "ipsum",
    "dolor",
    "sit",
    "amet",
    "consectetur",
    "adipiscing",
    "elit",
    "sed",
    "do",
    "eiusmod",
    "tempor",
    "incididunt",
    "ut",
    "labore",
    "et",
    "dolore",
    "magna",
    "aliqua"
  ];

  Random random = Random();
  String result = 'Lorem ipsum ';

  for (int i = 0; i < length; i++) {
    result += '${words[random.nextInt(words.length)]} ';
  }

  return result.trim();
}
