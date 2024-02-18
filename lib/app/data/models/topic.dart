// class Topic {
//   String? Id;
//   String? name;
//   String? imageUrl;
//   int? numberOfLearnedLesson;
//   int? totalLesson;
//   String? state;

//   Topic(
//       {this.Id,
//       required this.name,
//       this.imageUrl,
//       this.numberOfLearnedLesson,
//       this.totalLesson,
//       this.state}) {
//     Id ??= DateTime.now().toString();
//     imageUrl ??= "";
//     numberOfLearnedLesson ??= 0;
//     totalLesson ??= 0;
//     state ??= "";
//   }
// }
class Topic {
  final String urlPath;
  final String title;
  double currentCompleted;
  double totalLessons;
  String state;

  Topic(this.urlPath, this.title, this.currentCompleted, this.totalLessons,
      this.state);
}
