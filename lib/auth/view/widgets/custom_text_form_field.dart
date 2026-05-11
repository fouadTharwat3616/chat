import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {
        this.hintText,
        this.labelText,
        this.maxLines=1,
        required this.controller,
        this.isPassword=false,
        this .validator,
        this.onChanged
      });
  final String? hintText;
  final String? labelText;
  final int maxLines;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white,fontSize: 18),
        label:widget.labelText != null ?Text( widget.labelText!,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 20,
            fontWeight: FontWeight.w400,

        ),): null,
        //  to hide counter that appear from using max length
       // counter: const SizedBox(),
        suffixIcon:widget.isPassword ? IconButton(
          onPressed: (){
            isObsecure = !isObsecure;
            setState(() {
            });
          },
          icon:isObsecure ?const Icon(Icons.visibility_off_outlined) :const Icon(Icons.visibility_outlined) ,
        ): null
      ),
      maxLines: widget.maxLines,
      obscureText: isObsecure,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
