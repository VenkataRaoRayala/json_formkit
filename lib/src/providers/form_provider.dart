import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonFormState {
  final Map<String, dynamic> values;
  final Map<String, String?> errors;

  JsonFormState({this.values = const {}, this.errors = const {}});

  JsonFormState copyWith({Map<String, dynamic>? values, Map<String, String?>? errors}) {
    return JsonFormState(
      values: values ?? this.values,
      errors: errors ?? this.errors,
    );
  }
}

class FormNotifier extends StateNotifier<JsonFormState> {
  FormNotifier() : super(JsonFormState());

  void updateValue(String key, dynamic value) {
    final newValues = Map<String, dynamic>.from(state.values);
    newValues[key] = value;
    state = state.copyWith(values: newValues);
  }

  void setError(String key, String? error) {
    final newErrors = Map<String, String?>.from(state.errors);
    if (error == null) {
      newErrors.remove(key);
    } else {
      newErrors[key] = error;
    }
    state = state.copyWith(errors: newErrors);
  }

  void clearErrors() {
    state = state.copyWith(errors: {});
  }
}

final formProvider = StateNotifierProvider<FormNotifier, JsonFormState>((ref) => FormNotifier());
