import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entity/course_entity.dart';

// dart run build_runner build -d
part 'course_hive_model.g.dart';
@HiveType(typeId: HiveTableConstant.batchTableId)
class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? courseId;
  @HiveField(1)
  final String courseName;

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  const CourseHiveModel.intial()
      : courseId = '',
        courseName = '';

  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  CourseEntity toEntity() {
    return CourseEntity(
      courseId: courseId,
      courseName: courseName,
    );
  }

  @override
  List<Object?> get props => [courseId, courseName];
}
