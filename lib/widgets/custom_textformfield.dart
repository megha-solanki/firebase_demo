import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool readOnly;
  final bool isAbsorbing;
  final bool isEnabled;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? label;
  final String hintText;
  final String? dLabel;
  final int? maxLine;
  final Color? bgColor;
  final String? initVal;
  final Widget? pImage;
  final Widget? sImage;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  const CustomTextFormField(
      {super.key,
      this.readOnly = false,
      this.isAbsorbing = false,
      this.isEnabled = true,
      this.onChanged,
      this.bgColor,
      this.initVal,
      this.pImage,
      this.sImage,
      this.validator,
      this.dLabel,
      this.onTap,
      required this.hintText,
      this.keyboardType,
      this.maxLine,
      this.controller,
      this.prefixIconConstraints,
      this.suffixIconConstraints,
      this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            "$label",
            style: const TextStyle(fontSize: 13),
          ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: AbsorbPointer(
            absorbing: isAbsorbing,
            child: TextFormField(
              initialValue: initVal,
              onChanged: onChanged,
              cursorColor: Colors.black,
              readOnly: readOnly,
              controller: controller,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.black),
              maxLines: maxLine ?? 1,
              validator: validator,
              enabled: isEnabled,
              decoration: InputDecoration(
                hintText: hintText,
                constraints: const BoxConstraints(maxHeight: 50),
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                hintStyle: TextStyle(fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                contentPadding: const EdgeInsets.only(
                    top: 13, bottom: 13, left: 12, right: 12),
                prefixIconConstraints: prefixIconConstraints,
                suffixIconConstraints: suffixIconConstraints,
                prefixIcon: pImage != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 9),
                        child: pImage,
                      )
                    : null,
                suffixIcon: sImage != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: sImage)
                    : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.1), width: 0.70)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.1), width: 0.70)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide:
                      const BorderSide(color: Colors.indigo, width: 0.70),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(color: Colors.red, width: 0.70),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
