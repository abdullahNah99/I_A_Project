import 'package:flutter/material.dart';
import 'package:i_a_project/core/constants.dart';

class SearchTextField extends StatelessWidget{
  const SearchTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
   return   TextField(
decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color:  AppConstants.gradient1,
    ),
    borderRadius: BorderRadius.circular(12),
     ),
     hintText: 'Search',
     suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search))
),
      );
    
  }}
