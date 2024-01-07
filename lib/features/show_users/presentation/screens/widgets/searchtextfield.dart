import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget{
  const SearchTextField({super.key});
  
  @override
  Widget build(BuildContext context) {
   return   TextField(
decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.blue
    ),
    borderRadius: BorderRadius.circular(12),
     ),
     hintText: 'Search',
     suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search))
),
      );
    
  }}
