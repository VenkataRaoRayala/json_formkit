import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/field_config.dart';
import '../providers/form_provider.dart';

class JsonCheckboxField extends ConsumerWidget {
  final FieldConfig field;

  const JsonCheckboxField({required this.field, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);
    final currentValue = formState.values[field.key] ?? false;

    return CheckboxListTile(
      title: Text(field.label),
      value: currentValue,
      onChanged: (val) {
        notifier.updateValue(field.key, val ?? false);
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
