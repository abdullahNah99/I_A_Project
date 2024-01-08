import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_cubit.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';
import 'package:i_a_project/features/show_users/presentation/screens/widgets/custom_list_item.dart';
import 'package:i_a_project/features/show_users/presentation/screens/widgets/searchtextfield.dart';
import 'package:i_a_project/features/show_users/presentation/screens/widgets/users_listview.dart';

class ShowUsersBody extends StatelessWidget{
  const ShowUsersBody({super.key});
  @override
  Widget build(BuildContext context) {

   return  BlocBuilder<ShowUsersCubit,ShowUsersStates>(  
      builder: (context, state) {
        final ShowUsersCubit cubit = BlocProvider.of<ShowUsersCubit>(context);
     
   return   Padding(
       padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
       child: Column(
         children: [
        SearchTextField(),
        ListOfUsers(),
        TextButton(onPressed: (){
          cubit.addUrersToGroup();
        }, child: Text('adddd'))
         ],
       ),
     );
   });
  }
  
}



