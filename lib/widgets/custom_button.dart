import 'package:flutter/material.dart';

import 'loading_component.dart';


class CustomButton extends StatelessWidget {
  final bool? isLoading;
  final VoidCallback onPressed;
  final String label;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? txtColor;

  const CustomButton(
      {super.key,
      this.isLoading,
      required this.onPressed,
      this.bgColor,
      this.txtColor,
      this.height,
      this.width,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(bgColor ?? Colors.indigo),
          elevation: MaterialStateProperty.all<double>(0),
        ),
        onPressed: isLoading == true ? null : onPressed,
        child: isLoading == true
            ?   const LoadingComponent(color: Colors.white,)
            : Text(
                label,
                style: const TextStyle(color: Colors.white,fontSize: 15,letterSpacing: 0.3),
              ),
      ),
    );
  }
}
