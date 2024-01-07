import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_cubit.dart';
import 'package:i_a_project/features/show_users/presentation/cubits/show_users_states.dart';

class CustomListViewItem extends StatelessWidget{
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
  return BlocBuilder<ShowUsersCubit,ShowUsersStates>(  
      builder: (context, state) {
        final ShowUsersCubit cubit = BlocProvider.of<ShowUsersCubit>(context);
        return  Container(
      decoration: BoxDecoration(
    
      ),
      // width:500,
      // height:55,
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Maram Mahmoud Alghsh',style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,   
               color: Colors.blue),),
            SizedBox(
              height: 5, 
            ),
            Text('Maram44@gmail.com',style: TextStyle(
               fontWeight: FontWeight.w200,
              fontSize: 15),),
            ],
          ),
          SizedBox(width: 150,),
         Container(
          
          width: 55,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: cubit.colorbutton,
          ),
          child: TextButton(onPressed: (){
            cubit.changeColor();
          },
          child: Text('ADD',style: TextStyle(color: cubit.colortextm),),),
         )
        ],
      ),
    
    );}
  );
  }

}