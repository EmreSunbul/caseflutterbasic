import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool? isloading;
  final Widget child;

  LoadingWidget({
    required this.isloading,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
   if (isloading == null)
   {
 return const Center(
  child: CircularProgressIndicator(
    color: Colors.orange,
  ),
 );
   }
   else if( isloading == false)
   {
    return const Center(child: Text("Bir sorun oluştu, tekrar deneyiniz."),);  
    
   }
    else {
      return child;
    }
  }
}