import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/providers/apis/topic_api.dart';
import 'package:vsa_mobile/app/data/providers/data_center.dart';
import 'package:vsa_mobile/app/data/repositoryInterface/topic_interface.dart';

class TopicRepository implements TopicInterfaceRepository {
  final topic_api = TopicAPI();
  @override
  Future<List<Topic>> fetchTopics() async {
    DataCenter.instance.topics.value = await topic_api.fetchTopics();
    return [...DataCenter.instance.topics];
  }

  @override
  Future<Topic?> updateTopics(Topic topic) async {
    var temp = await topic_api.updateTopic(topic);
    for (var topic in DataCenter.instance.topics) {
      if (temp.topicName == topic.topicName) {
        DataCenter.instance.topics.remove(topic);
        DataCenter.instance.topics.add(temp);
        return temp;
      }
    }
    return null;
  }
}
