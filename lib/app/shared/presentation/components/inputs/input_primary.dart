import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasikuna_admin/core/theme/app_colors.dart';

class InputPrimary extends ConsumerWidget {
  const InputPrimary({
    Key? key,
    required this.label,
    this.privateText = false,
    this.suffix,
    this.onChanged,
    this.onEditingComplete,
    this.initialValue,
    this.enabledfield = true,
    this.maxlines = 1,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.autofocus = false,
    this.inputFormats,
    this.validator,
    this.hinText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.filled,
    this.filledColor,
    this.textAlign = TextAlign.start,
  }) : super(key: key);
  final String label;
  final bool privateText;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? initialValue;
  final bool? enabledfield;
  final int? maxlines;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormats;
  final String? Function(String?)? validator;
  final String? hinText;
  final AutovalidateMode? autovalidateMode;
  final bool? filled;
  final Color? filledColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorsStateProvider);
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      enableSuggestions: true,
      inputFormatters: inputFormats,
      autofocus: autofocus ?? false,
      keyboardType: textInputType,
      maxLines: maxlines,
      readOnly: !enabledfield!,
      initialValue: textEditingController == null ? initialValue : null,
      controller: initialValue == null ? textEditingController : null,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign,
      style: TextStyle(
        color: colors[ColorsName.mainLetterColor],
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
      ),
      obscureText: privateText,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: colors[ColorsName.secondaryLetterColor],
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
        filled: filled,
        fillColor: filledColor,
        hintText: hinText,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1.0,
            color: colors[ColorsName.borderBoxColor]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 1.6,
            color: colors[ColorsName.primaryColor]!,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: .6, color: Colors.red),
        ),
        floatingLabelStyle: TextStyle(
          color: colors[ColorsName.secondaryLetterColor],
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: TextStyle(
          color: colors[ColorsName.secondaryLetterColor],
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
        labelText: label,
      ),
    );
  }
}
