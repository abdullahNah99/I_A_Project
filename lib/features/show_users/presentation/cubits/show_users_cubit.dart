import 'dart:js';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/core/errors/failure.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/features/show_users/data/models/showusersmodel.dart';
import 'package:i_a_project/features/show_users/data/models/usersid.dart';
import 'package:i_a_project/features/show_users/data/repos/users_repo.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';


class ShowUsersCubit extends Cubit<ShowUsersStates> {
  final users_repo ur;
  final String token;
  final formKey = GlobalKey<FormState>();
  final int group_id=1;
  List<String> user_ids=[];
  ShowUsersCubit({required this.ur, required this.token}):super(ShowUsersInitial());
  Color colorbutton=Colors.white;
  Color colortextm=AppConstants.gradient3;


  // void changeColor(){

  //   if(colorbutton==AppConstants.gradient3){
  //     colorbutton=Colors.white;
  //     colortextm=AppConstants.gradient3;
  //   }else{
  //      colorbutton=AppConstants.gradient3;
  //      colortextm=Colors.white;

  //   }
   
  //   emit(ShowUsersInitial());
  // }
Future <void>fetchurers()async{
  emit(ShowUsersLoading());
  try {
    Either<Failure, List<showusersmodel>> result = await ur.fetchlistofusers(token: token);
    
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


Future <void>addUrersToGroup()

async{
  emit(ShowUsersLoading());
  try {
    (await ur.addusers(groupid: group_id, token: token,user_ids:user_ids )).fold(
                                        // ignore: avoid_print
                                        (l) => print(l),
                                        // ignore: avoid_print
                                        (r) {
                                  print("success");
                                 
                                });;
    
    //emit(AddUsersSuccess());
  } catch (e) {
    // Handle exceptions or errors if necessary
     emit(ShowUsersFailure("An error occurred: $e"));
  }

}



}




