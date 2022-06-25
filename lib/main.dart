import 'package:changvalue/homepage.dart';
import 'package:changvalue/provider/add_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider<AddModel>(create: (context) => AddModel()),
        
         
       ],
       child: MaterialApp(home:MyApp()),
     ) ,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

int value=1;
List list=["Hello","Welcome"];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    

  WidgetsBinding.instance.addPostFrameCallback((_) {
    
    Provider.of<AddModel>(context, listen: false).additionFunction(yourVal: 20);
  


    });
    
  }


AddModel? valuea;

  @override
  Widget build(BuildContext context) {
    

     AddModel objectAddModel = Provider.of<AddModel>(context,listen: false);


 

    return  Scaffold(
          body: Consumer<AddModel>(
            builder: (context,object,widget) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
  Text(object.value.toString(),textScaleFactor: 2),
ElevatedButton(onPressed: (){

                

  object.additionFunction(yourVal:object.value);
}, child: Text("Change Value With Provider:"+object.value.toString(),textScaleFactor: 2,)),

                  Text(value.toString(),textScaleFactor: 2),
                   Text(list[0].toString(),textScaleFactor: 2),
                    Text(list[1].toString(),textScaleFactor: 2),
                  ElevatedButton(child: Text("Go to Page 2",),onPressed: (){
                     _navigateAndDisplaySelection(context);
                    
                  },),
                ],
              );
            }
          ),
        );
  
    
  }
    
   Future _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    list = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) =>  HomePage(value: value,list: list,)),
    );
    setState(() {
      
    });
  }
}

