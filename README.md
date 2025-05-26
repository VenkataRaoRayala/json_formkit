
# 📦 json_formkit

A dynamic, themeable, and developer-friendly Flutter forms plugin powered by JSON configuration. Supports built-in validators, custom form fields, and full theming control.

## ✨ Features

- Build complete forms using simple JSON config
- Reusable form fields with built-in validators (e.g. phone, email, etc.)
- Custom validator support per field
- Form submission returns data as JSON map
- Fully customizable form theming
- Light and dark mode support

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  json_formkit: <latest>
```

## 🚀 Usage

```dart
final formJson = [
  {
    "type": "text",
    "name": "full_name",
    "label": "Full Name",
    "required": true,
  },
  {
    "type": "phone",
    "name": "contact_number",
    "label": "Phone Number",
    "required": true,
  },
  {
    "type": "checkbox",
    "name": "accept_terms",
    "label": "Accept Terms",
    "required": true,
  }
];

JsonForm(
  formConfig: formJson,
  onSubmit: (formData) {
    print("Form submitted: \$formData");
  },
);
```

## 🎨 Custom Themes

You can pass a `FormTheme` object to override styling for each field type.

```dart
JsonForm(
  formConfig: formJson,
  theme: FormTheme(
    inputDecoration: InputDecoration(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.grey.shade200,
    ),
    labelStyle: TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.bold,
    ),
    errorStyle: TextStyle(
      color: Colors.redAccent,
    ),
    checkboxActiveColor: Colors.deepPurple,
    dropdownStyle: TextStyle(color: Colors.deepPurple),
    datePickerTextStyle: TextStyle(color: Colors.deepPurple),
  ),
);
```

If no theme is passed, it defaults to light or dark theme based on context.

## ✅ Built-in Field Types

- `text` — normal input field with word limit support
- `email` — email input with regex validation
- `phone` — phone number field with validation (10–15 digits)
- `checkbox` — toggle boolean field
- `dropdown` — select from list
- `date` — select a date

## 🛡️ Validation

Each field supports:

- `required: true`
- Built-in validators (e.g. `validateEmail`, `validatePhone`)
- Pass your own `customValidator` for full control

## 📄 License

MIT

---

Made with ❤️ by the community.
