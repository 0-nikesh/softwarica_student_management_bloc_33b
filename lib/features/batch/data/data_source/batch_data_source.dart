import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

abstract interface class iBatchDataSource {
  Future<Either<Failure, List<CourseEntity>>> getBatches();
  Future<Either<Failure, void>> createBatch(CourseEntity batch);
  Future<Either<Failure, void>> deleteBatch(String id);
}
