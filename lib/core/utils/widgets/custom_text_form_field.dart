import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData iconData;

  final bool expands;
  final bool obscureText;
  final void Function()? onPressed;
  final Function validator;
  final bool isNumber;
  final IconData? suffixIcon;
  final bool isSuffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.isNumber,
    required this.validator,
    required this.iconData,
     this.suffixIcon,
    required this.isSuffixIcon,
    required this.expands,
    required this.obscureText,
    this.controller,
    this.onPressed,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            obscureText:
                obscureText == null || obscureText == false ? false : true,
            onChanged: onChanged,
            controller: controller,
            expands: expands,
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: (value) => validator(value),
            decoration: InputDecoration(
              prefixIcon: Icon(iconData),
              labelText: labelText,
              
              suffixIcon:isSuffixIcon ? InkWell(
                  onTap: onPressed,
                  child: Icon(
                    suffixIcon,
                  )) : const SizedBox.shrink()
            )),
      ],
    );
  }
}
