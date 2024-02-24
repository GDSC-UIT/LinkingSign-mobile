import 'package:vsa_mobile/app/data/models/word.dart';

abstract class WordInterfaceRepository {
  Future<List<Word>> fetchWords();
  Future<void> updateWord(Word word, bool isLearned);
  Future<List<Word>> getWordsByTopicId(String topic_id);
  Future<Word> getSingleWord(String id);
}
