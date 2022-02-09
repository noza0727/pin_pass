import 'package:flutter_test/flutter_test.dart';
import 'package:pin_pass/pin_input/pin_input_cubit.dart';

void main() {

  test('Functions should be working correctly', (){
    final pinInputCubit = PinInputCubit();

    //Testing if input number is added to pin sequence
    expect(pinInputCubit.addNumber('1'), pinInputCubit.pin);

    //Testing if the pin sequence is the same as input numbers by the user when taped on numbers
    expect(pinInputCubit.onNumberTap(2), pinInputCubit.pin);

    //Testing if the pin is correctly deleted and only the previous numbers are left after deleting the next
    expect(pinInputCubit.onBackspace(), ['1']);

    //Testing if the pin is empty when all inputs are deleted
    expect(pinInputCubit.onBackspace(), List.empty());
  });

  test('List should be of length 4', (){
    final pinInputCubit = PinInputCubit();

    pinInputCubit.onNumberTap(2);
    pinInputCubit.onNumberTap(5);
    pinInputCubit.onNumberTap(6);
    pinInputCubit.onNumberTap(3);

    //Testing if the length of the pin is 4 after inputting 4 numbers
    expect(pinInputCubit.pin.length, 4);

    //Adding 5th number to the pin
    pinInputCubit.onNumberTap(7);

    //Testing if the length of the pin is still 4 even after inputting 5 numbers
    expect(pinInputCubit.pin.length, 4);

    //Testing if the last pin number is the fourth inputted number by the user even when the user inputs 5 numbers
    expect(pinInputCubit.pin.last, '3');
  });
}
