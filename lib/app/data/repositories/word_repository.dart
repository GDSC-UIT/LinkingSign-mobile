import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/providers/apis/word_api.dart';
import 'package:vsa_mobile/app/data/repositoryInterface/word_interface.dart';

class WordRepository implements WordInterfaceRepository {
  final word_api = WordAPI();
  @override
  Future<List<Word>> fetchWords() async {
    List<Word> wordList = await word_api.fetchWords();
    return wordList;
  }

  @override
  Future<void> updateWord(Word word, bool isLearned) async {
    await word_api.updateWords(word, isLearned);
  }

  @override
  Future<List<Word>> getWordsByTopicId(String topic_id) async {
    List<Word> wordList = await word_api.getWordsByTopicId(topic_id);
    return wordList;
  }

  @override
  Future<Word> getSingleWord(String id) async {
    Word get_word = await word_api.getSingleWord(id);
    return get_word;
  }
}
