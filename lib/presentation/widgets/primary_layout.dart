import 'package:flutter/material.dart';

class PrimaryLayout  extends StatefulWidget{

  final Widget child;
  const PrimaryLayout({super.key, required this.child});

 
  _StatePrimaryLayout createState() => _StatePrimaryLayout();
}

class _StatePrimaryLayout extends State<PrimaryLayout>{
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(appBar:_buildAppbar() ,
   
   body: widget.child,
   );
  }

}

 PreferredSizeWidget _buildAppbar(){
  return AppBar(
    title:  Text("App bar"),
    actions: [
    IconButton(icon: Icon(Icons.search),onPressed: (){},),
        IconButton(icon: Icon(Icons.favorite),onPressed: (){},),
            IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){},),




  ],);
}
