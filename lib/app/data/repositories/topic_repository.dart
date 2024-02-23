import 'package:vsa_mobile/app/data/models/topic.dart';
import 'package:vsa_mobile/app/data/providers/apis/topic_api.dart';
import 'package:vsa_mobile/app/data/repositoryInterface/topic_interface.dart';

class TopicRepository implements TopicInterfaceRepository {
  final topic_api = TopicAPI();
  @override
  Future<List<Topic>> fetchTopics() async {
    List<Topic> topicList = await topic_api.fetchTopics();
    return topicList;
  }

  @override
  Future<Topic?> updateTopics(Topic topic) async {
    // var temp = await topic_api.updateTopic(topic);
    // for (var topic in ) {
    //   if (temp.topicName == topic.topicName) {

    //     return temp;
    //   }
    // }
    // return null;
  }
}
