import 'package:la_vie_with_clean_architecture/features/blogs/data/models/plant_blogs_model.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/models/seed_blogs_model.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/data/models/tool_blogs_model.dart';
import 'package:la_vie_with_clean_architecture/features/blogs/domain/entities/blogs_entitie.dart';

class BlogsModel extends BLogsEntitie {
  const BlogsModel(super.plantEntitie, super.seedsEntitie, super.toolEntitie);

  factory BlogsModel.fromJson(Map<String, dynamic> json) {
    return BlogsModel(
      List.from(
          (json['plants'] as List).map((e) => PlantBlogsModel.fromJson(e))),
      List.from(
          (json['seeds'] as List).map((e) => SeedsBlogsModel.fromJson(e))),
      List.from(
          (json['tools'] as List).map((e) => ToolsBlogsModel.fromJson(e))),
    );
  }
}
