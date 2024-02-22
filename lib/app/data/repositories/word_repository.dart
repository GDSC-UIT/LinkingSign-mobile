import 'package:vsa_mobile/app/data/models/word.dart';
import 'package:vsa_mobile/app/data/providers/apis/word_api.dart';
import 'package:vsa_mobile/app/data/providers/data_center.dart';
import 'package:vsa_mobile/app/data/repositoryInterface/word_interface.dart';

class WordRepository implements WordInterfaceRepository {
  final word_api = WordAPI();
  @override
  Future<List<Word>> fetchWords() async {
    DataCenter.instance.words.value = await word_api.fetchWords();
    return [...DataCenter.instance.words];
  }

  @override
  Future<Word?> updateWords(Word word) async {
    var temp = await word_api.updateWords(word);
    for (var word in DataCenter.instance.words) {
      if (temp.word == word.word) {
        DataCenter.instance.words.remove(word);
        DataCenter.instance.words.add(temp);
        return temp;
      }
    }
    return null;
  }
}
