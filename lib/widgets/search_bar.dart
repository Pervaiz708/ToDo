import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class SearchBarBox extends StatefulWidget {
  const SearchBarBox({super.key});

  @override
  State<SearchBarBox> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarBox> {
 final TextEditingController _controller = TextEditingController();

 @override
 void dispose(){
  _controller.dispose();
  super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return  
        TextFormField(
          decoration: const InputDecoration(
               border: InputBorder.none,
              hintText: 'Search here...',
               prefixIcon: Icon(Icons.search))

       );
  }
            
}