import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_formkit/json_formkit.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final sampleFields = <FieldConfig>[
    FieldConfig(key: 'name', label: 'Name', type: 'text', required: true),
    FieldConfig(key: 'email', label: 'Email', type: 'text', required: true, validators: {'email': true}),
    FieldConfig(key: 'phone', label: 'Phone Number', type: 'phone', required: true),
    FieldConfig(key: 'gender', label: 'Gender', type: 'dropdown', required: true, options: ['Male', 'Female', 'Other']),
    FieldConfig(key: 'accept', label: 'Accept Terms', type: 'checkbox'),
    FieldConfig(key: 'dob', label: 'Date of Birth', type: 'date', required: true),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = FormTheme.light();
    return MaterialApp(
      title: 'json_formkit Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: theme.inputDecorationTheme,
        scaffoldBackgroundColor: theme.backgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('json_formkit Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormExample(fields: sampleFields, theme: theme),
        ),
      ),
    );
  }
}

class FormExample extends ConsumerStatefulWidget {
  final List<FieldConfig> fields;
  final FormTheme theme;

  const FormExample({required this.fields, required this.theme, super.key});

  @override
  ConsumerState<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends ConsumerState<FormExample> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final formNotifier = ref.read(formProvider.notifier);
    formNotifier.clearErrors();

    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    final formState = ref.read(formProvider);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Form Data'),
        content: SingleChildScrollView(
          child: Text(formState.values.toString()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fieldsWidgets = widget.fields
        .map((field) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: FieldFactory.createField(field, widget.theme),
            ))
        .toList();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...fieldsWidgets,
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _submit, child: const Text('Submit')),
        ],
      ),
    );
  }
}
