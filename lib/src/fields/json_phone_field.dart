import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_formkit/json_formkit.dart';
import '../utils/validators.dart';

class JsonPhoneField extends ConsumerWidget {
  final FieldConfig field;
  final FormTheme theme;

  const JsonPhoneField({required this.field, required this.theme, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);
    //final controller = TextEditingController(text: formState.values[field.key]?.toString() ?? '');

    return TextFormField(
      //controller: controller,
      initialValue: formState.values[field.key],
      keyboardType: TextInputType.phone,
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
        if (field.required) {
          final res = Validators.validateRequired(val);
          if (res != null) return res;
        }
        if (val != null && val.isNotEmpty) {
          final res = Validators.validatePhone(val);
          if (res != null) return res;
        }
        return null;
      },
    );
  }
}
