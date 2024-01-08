import 'package:dartz/dartz.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';

abstract class users_repo{

  Future<Either<Failure,List<showusersmodel>>> fetchlistofusers({required String token});
  Future<Either<Failure,List<showusersmodel>>> fetchresultsearch();
}