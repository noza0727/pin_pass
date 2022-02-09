import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_pass/resources/colors.dart';

typedef KeyboardTapCallback = void Function(int number);

class Keypad extends StatelessWidget {
  const Keypad({Key? key, this.leftIcon, this.rightIcon, required this.onKeyboardTap, this.onLeftIcon, this.onRightIcon}) : super(key: key);

  final Widget? leftIcon;
  final Widget? rightIcon;

  final KeyboardTapCallback onKeyboardTap;
  final Function()? onLeftIcon;
  final Function()? onRightIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(1),
              button(2),
              button(3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(4),
              button(5),
              button(6),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button(7),
              button(8),
              button(9),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              leftIcon != null
                  ? GestureDetector(
                      onTap: onLeftIcon,
                      child: leftIcon!
              ) : Container(),
              button(0),
              rightIcon != null
                  ? GestureDetector(
                      child: rightIcon!,
                      onTap: onRightIcon,
              ) : Container(),
            ],
          )
        ],
      ),
    );
  }

  button(int number){
    return InkWell(
      onTap: () => onKeyboardTap(number),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 50,
        width: 50,
        child: Center(
            child: Text(
              '$number',
              style: TextStyle(color: AppColors.black, fontSize: 34, fontFamily: 'Roboto' ),)
        ),
      ),
    );
  }
}
