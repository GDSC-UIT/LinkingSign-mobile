import 'package:vsa_mobile/app/data/models/topic.dart';

abstract class TopicInterfaceRepository {
  Future<List<Topic>> fetchTopics();
  Future<Topic?> updateTopics(Topic topic);
}
