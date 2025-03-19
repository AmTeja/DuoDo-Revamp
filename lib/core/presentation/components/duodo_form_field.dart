import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DuodoFormField extends StatelessWidget {
  const DuodoFormField({
    required this.onChanged,
    this.label = '',
    this.hintText = '',
    this.enabled = true,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.maxLines,
    this.onTap,
    super.key,
    this.keyboardType,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.controller,
  });

  final String label;
  final String hintText;
  final bool enabled;
  final bool readOnly;
  final TextInputAction textInputAction;

  final void Function(String) onChanged;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      onTap: onTap,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
