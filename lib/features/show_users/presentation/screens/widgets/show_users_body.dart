import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:i_a_project/core/utils/app_router.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/core/widgets/custom_error_widget.dart';
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
      if (state is ShowUsersSuccess) {
   return   Padding(
       padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
        SearchTextField(),
        ListOfUsers(),
         CustomButton(
                    text: 'ADD TO GROUP',
                    color: Colors.blue,
                    onTap: () async {
                      
                        await cubit.addUrersToGroup();
                    GoRouter.of(context).go(AppRouter.kGroupsView);
                    },
                  ),
        
         ],
       ),
     );}else if(state is ShowUsersFailure){
  return CustomErrorWidget(errMessage: state.errormessege);
}
else {
  return const Center(child: const CircularProgressIndicator());
}
   });
  }
  
}



