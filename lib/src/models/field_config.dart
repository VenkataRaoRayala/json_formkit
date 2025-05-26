class FieldConfig {
  final String key;
  final String label;
  final String type;
  final bool required;
  final Map<String, dynamic>? validators;
  final List<dynamic>? options; // for dropdown, checkbox etc.
  final String? Function(String?)? customValidator;


  FieldConfig({
    required this.key,
    required this.label,
    required this.type,
    this.required = false,
    this.validators,
    this.options,
    this.customValidator
  });

  factory FieldConfig.fromJson(Map<String, dynamic> json) {
    return FieldConfig(
      key: json['key'],
      label: json['label'],
      type: json['type'],
      required: json['required'] ?? false,
      validators: json['validators'] != null ? Map<String, dynamic>.from(json['validators']) : null,
      options: json['options'] != null ? List<dynamic>.from(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'label': label,
      'type': type,
      'required': required,
      'validators': validators,
      'options': options,
    };
  }
}
