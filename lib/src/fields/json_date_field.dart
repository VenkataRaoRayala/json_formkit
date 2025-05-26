import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/field_config.dart';
import '../providers/form_provider.dart';
import '../theme/form_theme.dart';

class JsonDateField extends ConsumerWidget {
  final FieldConfig field;
  final FormTheme theme;

  const JsonDateField({required this.field, required this.theme, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);
    final selectedDate = formState.values[field.key] as DateTime?;

    final controller = TextEditingController(
        text: selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : '');

    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          notifier.updateValue(field.key, picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
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
          validator: (val) {
              if (field.customValidator != null) {
    return field.customValidator!(val);
  }
            if (field.required && selectedDate == null) {
              return 'Please select ${field.label}';
            }
            return null;
          },
        ),
      ),
    );
  }
}
