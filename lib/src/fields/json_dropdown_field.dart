import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/field_config.dart';
import '../providers/form_provider.dart';
import '../theme/form_theme.dart';

class JsonDropdownField extends ConsumerWidget {
  final FieldConfig field;
  final FormTheme theme;

  const JsonDropdownField({required this.field, required this.theme, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);

    final currentValue = formState.values[field.key];

    return DropdownButtonFormField<dynamic>(
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
      items: field.options
              ?.map((opt) => DropdownMenuItem(value: opt, child: Text(opt.toString())))
              .toList() ??
          [],
      value: currentValue,
      onChanged: (val) {
        notifier.updateValue(field.key, val);
      },
      validator: (val) {
          if (field.customValidator != null) {
    return field.customValidator!(val);
  }
        if (field.required && (val == null || val.toString().isEmpty)) {
          return 'Please select ${field.label}';
        }
        return null;
      },
    );
  }
}
