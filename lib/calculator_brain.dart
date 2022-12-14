import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  int height;
  int weight;
  late double _bmi;
  
  String calulateBMI(){
    _bmi=weight/pow(height/100,2 );
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'OverWeight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }
}