import 'package:hive/hive.dart';

part 'candidate_model.g.dart';

@HiveType(typeId: 0)
class Candidate extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String teamName;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  int voteCount;

  Candidate({
    required this.name,
    required this.teamName,
    required this.imagePath,
    this.voteCount = 0,
  });
}
