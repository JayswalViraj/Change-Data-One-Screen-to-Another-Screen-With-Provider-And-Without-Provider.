import 'package:changvalue/provider/add_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  int value;
  List list=[];
   HomePage({super.key,required this.value,required this.list});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

      AddModel objectAddModel = Provider.of<AddModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Back"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

    ElevatedButton(onPressed: (){
          objectAddModel.additionFunction(yourVal: objectAddModel.value);
 
         
          }, child: Text("Provider Value:  "+objectAddModel.value.toString(),textScaleFactor: 2,),),
      

    

          Text("Value:  "+widget.list[0].toString(),textScaleFactor: 2,),

           Text("Value:  "+widget.list[1].toString(),textScaleFactor: 2,),
            Text("Value:  "+widget.value.toString(),textScaleFactor: 2,),

          ElevatedButton(onPressed: (){
          
             
              widget.value++;
              widget.list[0]="Your Value Changed";
              widget.list[1]="Your Value Changed";
              Navigator.pop(context,widget.list);

            
            

            setState(() {
              
            });
         
          }, child: Text("Increment")),
        ],
      ),
    );
  }
}