import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/core/constants.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_cubit.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';

class CustomListViewItem extends StatelessWidget{
   CustomListViewItem({super.key, required this.name, required this.email, required this.id});
  final String name;
   final String email;
   final int id;
  List< int>?ids;

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<ShowUsersCubit,ShowUsersStates>(  
      builder: (context, state) {
        final ShowUsersCubit cubit = BlocProvider.of<ShowUsersCubit>(context);
        return  Center(
          child: Container(
                decoration: BoxDecoration(
              
                ),
                
                child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,   
                 color: AppConstants.gradient1,),),
              SizedBox(
                height: 5, 
              ),
              Text(email,style: TextStyle(
                 fontWeight: FontWeight.w200,
                fontSize: 15,
                ),),
              ],
            ),
            SizedBox(width: 150,),
           Container(
            
            width: 55,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppConstants.gradient1,
            ),
            child: TextButton(onPressed: (){
              
               cubit.user_ids.add("$id");
            },
            child: Text('ADD'),),
           )
          ],
                ),
              
              ),
        );}
  );
  }

}