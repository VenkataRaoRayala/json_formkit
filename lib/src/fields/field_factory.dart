import 'package:flutter/material.dart';
import '../models/field_config.dart';
import '../theme/form_theme.dart';
import 'json_text_field.dart';
import 'json_phone_field.dart';
import 'json_dropdown_field.dart';
import 'json_checkbox_field.dart';
import 'json_date_field.dart';

class FieldFactory {
  static Widget createField(FieldConfig field, FormTheme theme) {
    switch (field.type) {
      case 'text':
        return JsonTextField(field: field, theme: theme);
      case 'phone':
        return JsonPhoneField(field: field, theme: theme);
      case 'dropdown':
        return JsonDropdownField(field: field, theme: theme);
      case 'checkbox':
        return JsonCheckboxField(field: field);
      case 'date':
        return JsonDateField(field: field, theme: theme);
      default:
        return Text('Unsupported field type: ${field.type}');
    }
  }
}
