// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study/Controller/controller.dart';
import 'package:study/view/loading_widget.dart';

final controller = ChangeNotifierProvider((ref) => Controller());
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
   ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     var read = ref.read(controller);
    var watch = ref.watch(controller);
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 20, 30, 5),
body: LoadingWidget(
  
  isloading: watch.isloading,
  child:   Column(
  
    children: [
  
      Text('Kullanıcılar', style: TextStyle(fontWeight: FontWeight.bold),),
  
      ListView.separated(
        
        shrinkWrap: true,
        itemCount: watch.users.length,
  
        separatorBuilder: ( BuildContext context,int index)
  
        {
  
                  return const SizedBox(height: 15,);
  
        },
  
        itemBuilder: ( BuildContext context,int index)
  
        {
  
         return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))), child: ListTile(
  
         leading:
  
          CircleAvatar( radius: 20  ,backgroundImage: NetworkImage(watch.users[index]!.avatar!),),
  
          title: Text("${watch.users[index]!.firstName}  ${watch.users[index]!.lastName}",
  
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  
          ),
  
          subtitle:  Text("${watch.users[index]!.email}",
  
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Colors.grey.shade400),
  
          ),
       ),);
        },
      )
    ],
  ),
),
    );
}
}