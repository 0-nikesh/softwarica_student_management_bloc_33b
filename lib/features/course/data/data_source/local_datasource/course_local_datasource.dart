import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/course_data_source.dart';
import 'package:softwarica_student_management_bloc/features/course/data/model/course_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class CourseLocalDatasource implements ICourseDataSource {
  final HiveService _hiveService;
  CourseLocalDatasource(this._hiveService);

  @override
  Future<void> createCourse(CourseEntity course) async {
    try {
      final coursehiveModel = CourseHiveModel.fromEntity(course);
      await _hiveService.addCourse(coursehiveModel);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> deleteCourse(String id) async {
    try {
      await _hiveService.deleteCourse(id);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<CourseEntity>> getCourses() {
    try {
      return _hiveService.getAllCourses().then(
        (value) {
          return value.map((e) => e.toEntity()).toList();
        },
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
