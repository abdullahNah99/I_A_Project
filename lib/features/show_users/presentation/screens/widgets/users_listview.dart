
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/widgets/custom_error_widget.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_cubit.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';
import 'package:i_a_project/features/show_users/presentation/screens/widgets/custom_list_item.dart';

class ListOfUsers extends StatelessWidget{
  const ListOfUsers({super.key});

  @override
  Widget build(BuildContext context) {
    
  return BlocBuilder<ShowUsersCubit,ShowUsersStates>(
    builder: (BuildContext context, state) { 
      if (state is ShowUsersSuccess) {
  return Expanded(
  child: ListView.builder(
   itemCount:state.showusers.length,
    itemBuilder:(context,index) {
    Axis.vertical;
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10 ),
  child:CustomListViewItem(
name: state.showusers[index].name,
email: state.showusers[index].email

  ) ,)
  ;
  }
  ),
      );
}else if(state is ShowUsersFailure){
  return CustomErrorWidget(errormessege: state.errormessege);
}
else {
  return const Center(child: const CircularProgressIndicator());
}
     },
 
  );
  }

}