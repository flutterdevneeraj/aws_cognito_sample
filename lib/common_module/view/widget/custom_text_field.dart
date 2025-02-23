import 'package:aws_cognito_sample/utils/dimensions.dart';
import 'package:aws_cognito_sample/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController ?controller;
  final FocusNode ?focusNode;
  final FocusNode ?nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function ?onChanged;
  final Function ?onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String ?prefixIcon;
  final double prefixSize;
  final bool divider;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;

  CustomTextField(
      {this.hintText = 'Write something...',
        this.controller,
        this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.onSubmit,
        this.onChanged,
        this.prefixIcon,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.prefixSize = Dimensions.PADDING_SIZE_SMALL,
        this.divider = false,
        this.textAlign = TextAlign.start,
        this.isAmount = false,
        this.isNumber = false,
        this.showTitle = false,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        widget.showTitle ? Text(widget.hintText, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)) : SizedBox(),
        SizedBox(height: widget.showTitle ? Dimensions.PADDING_SIZE_EXTRA_SMALL : 0),

        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
              : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              borderSide: BorderSide(style: BorderStyle.none, width: 0.5),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.prefixIcon != null ? Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.prefixSize),
              child: Image.asset(widget.prefixIcon!, height: 20, width: 20),
            ) : null,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
              onPressed: _toggle,
            ) : null,
          ),
          onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!(text) : null,
          onChanged: (text) => widget.onChanged,
        ),

        widget.divider ? Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider()) : SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
