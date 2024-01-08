import 'package:dartz/dartz.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';
import 'package:i_a_project/features/show_users/data/models/usersid.dart';

abstract class users_repo{

  Future<Either<Failure,List<showusersmodel>>> fetchlistofusers({required String token});
  Future<Either<Failure,List<showusersmodel>>> fetchresultsearch();
  Future<Either<Failure,void>> addusers
  ({ required int groupid,required String token, required List<String> user_ids});

}