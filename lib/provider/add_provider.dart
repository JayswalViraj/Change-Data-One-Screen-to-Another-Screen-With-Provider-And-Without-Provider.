import 'package:flutter/cupertino.dart';

class AddModel with ChangeNotifier{

int value=0;

additionFunction({required int yourVal}){
 value= yourVal+1;
notifyListeners();
}



}