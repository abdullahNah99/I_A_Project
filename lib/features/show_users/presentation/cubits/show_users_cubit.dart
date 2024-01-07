import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';


class ShowUsersCubit extends Cubit<ShowUsersStates> {
  final users_repo ur;
  ShowUsersCubit(this.ur):super(ShowUsersInitial());
  Color colorbutton=Colors.white;
  Color colortextm=Colors.blue;
  void changeColor(){

    if(colorbutton==Colors.blue){
      colorbutton=Colors.white;
      colortextm=Colors.blue;
    }else{
       colorbutton=Colors.blue;
       colortextm=Colors.white;

    }
   
    emit(ShowUsersInitial());
  }
Future <void>fetchurers()async{
  emit(ShowUsersLoading());
  try {
    Either<Failure, List<showusersmodel>> result = await ur.fetchlistofusers();
    
    result.fold(
      (failure) {
        emit(ShowUsersFailure(failure.errorMessege));
      },
      (users) {
        emit(ShowUsersSuccess(users));
      },
    );
  } catch (e) {
    // Handle exceptions or errors if necessary
    // emit(ShowUsersFailure("An error occurred: $e"));
  }

}
}