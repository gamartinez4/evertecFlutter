
import 'package:intl/intl.dart';

extension NumberParsing on String {
  String formatToDecimal(){
    try{
     final number = int.parse(this);
     final formatter = NumberFormat.decimalPattern('es');
     return formatter.format(number);
    }catch(e){
      return 'No data';
    }
  }
}
