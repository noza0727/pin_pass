import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_pass/pin_input/pin_input_cubit.dart';
import 'package:pin_pass/resources/colors.dart';
import 'package:pin_pass/resources/icons.dart';
import 'package:pin_pass/resources/styles.dart';
import 'package:pin_pass/utils/keypad.dart';

class PinInput extends StatelessWidget {
  const PinInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PinInputCubit(),
          child: BlocBuilder<PinInputCubit, int>(
            builder: (context, state) {
              final cubit = context.read<PinInputCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, top: 8.0),
                        child: SvgPicture.asset(AppIcons.info),
                      )
                  ),
                  const Expanded(
                    flex: 15,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                          child: Text(
                            'Please enter PIN code',
                            style: Styles.header,)
                      )
                  ),
                  Expanded(
                    flex: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.all(12),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  index < state ? AppColors.green : AppColors.white,
                                    border: Border.all(color: index < state ? AppColors.green : AppColors.gray)
                                  ),
                                );
                              },
                            itemCount: 4,
                          ),
                        ],
                      ),
                    )
                  ),

                  Expanded(
                    flex: 40,
                    child: Keypad(
                      onKeyboardTap: (number) => cubit.onNumberTap(number),
                      leftIcon: const Icon(Icons.fingerprint, color: AppColors.black, size: 32,),
                      rightIcon: SvgPicture.asset(AppIcons.backspace),
                      onRightIcon: () => cubit.onBackspace(),
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}


