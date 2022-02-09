import 'package:bloc/bloc.dart';

class PinInputCubit extends Cubit<int>{
  PinInputCubit() : super(0);
  List<String> pin = [];

  List<String> onNumberTap(int number){
    addNumber(number.toString());
    emit(pin.length);
    return pin;
  }

  addNumber(String number){
    if(pin.length < 4){
      pin.add(number.toString());
    }
    return pin;
  }

  onBackspace(){
    if(pin.isNotEmpty){
      pin.removeLast();
    }
    emit(pin.length);

    return pin;
  }
}