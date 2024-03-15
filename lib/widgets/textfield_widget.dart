import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldWidget extends StatefulWidget {
    TextfieldWidget({
      super.key,
      this.label,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.isPasswordField = false,
      this.controller,
      this.validator,
      this.keyboardType,
      this.margin,
      this.inputFormatters,
      this.initialValue,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.hideKeyboardTapOutside = true,
      this.autofocus = false,
      this.enabled = true,
      this.onSubmit,
      this.onTapOutside,
      this.onChanged,
      this.notEmpty,
    });

  final String? label;
  final String? hintText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  TextEditingController? controller;
  final String? Function(String?)? validator;
  Function(String)? onSubmit;
  Function()? onTapOutside;
  Function(String)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsets? margin;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  bool isPasswordField = false;
  bool hideKeyboardTapOutside = true;
  bool autofocus = false;
  bool enabled = true;
  bool? notEmpty;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {

    bool isObscureText = true;

    handleShowPassword() {
      setState(() {
        isObscureText = !isObscureText;
      });
    }
  @override
  Widget build(BuildContext context) {

    widget.controller ??= TextEditingController();
    return Container(
      margin: widget.margin,
      child: TextFormField(
        key: widget.key,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        validator: widget.notEmpty != null ? (value) => value == null || value.isEmpty ? "Campo obrigatório" : null : widget.validator,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        obscureText: widget.isPasswordField ? isObscureText : false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          isDense: true,
          suffixIcon: widget.isPasswordField   
            ? Visibility(
               visible: isObscureText,
               replacement: IconButton(
                 onPressed: handleShowPassword,
                 icon: const Icon(Icons.visibility_off_outlined),
               ),
               child: IconButton(
                 onPressed: handleShowPassword, 
                 icon: const Icon(Icons.visibility_outlined)
               )
             ) 
            : widget.suffixIcon ?? Visibility(
              visible: widget.enabled == true,
              child: ValueListenableBuilder(
                valueListenable: widget.controller!,
                builder: (contenxt, value, _) => Visibility(
                  visible: value.text.isNotEmpty,
                  child: GestureDetector(
                    onTap:() => widget.controller?.clear(),
                    child: const Icon(Icons.cancel_outlined, color: Colors.black),
                  ),
                ),
              ),
            ),
          prefixIcon: widget.prefixIcon,
          labelText: widget.label,
          hintText: widget.hintText,
        ),
        onFieldSubmitted: widget.onSubmit,
        onChanged: widget.onChanged,
        onTapOutside: widget.hideKeyboardTapOutside ?
          (event) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          }
          : null
      ),
    );
  }
}
