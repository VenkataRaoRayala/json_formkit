import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_formkit/json_formkit.dart';
import '../utils/validators.dart';

class JsonTextField extends ConsumerWidget {
  final FieldConfig field;
  final FormTheme theme;

  const JsonTextField({required this.field, required this.theme, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);
    return TextFormField(
      initialValue: formState.values[field.key]?.toString(),
      //controller: controller,
      decoration: InputDecoration(
        labelText: field.label,
        labelStyle: theme.labelStyle,
        errorText: formState.errors[field.key],
        errorStyle: theme.errorStyle,
        border: theme.inputDecorationTheme.border,
        focusedBorder: theme.inputDecorationTheme.focusedBorder,
        errorBorder: theme.inputDecorationTheme.errorBorder,
        contentPadding: theme.inputDecorationTheme.contentPadding,
        filled: theme.inputDecorationTheme.filled,
        fillColor: theme.inputDecorationTheme.fillColor,
      ),
      onChanged: (val) {
        notifier.updateValue(field.key, val);
      },
      validator: (val) {
          if (field.customValidator != null) {
    return field.customValidator!(val);
  }
        if (field.required) {
          final res = Validators.validateRequired(val);
          if (res != null) return res;
        }
        if (field.validators != null) {
          if (field.validators!.containsKey('email')) {
            final res = Validators.validateEmail(val);
            if (res != null) return res;
          }
        }
        return null;
      },
    );
  }
}
