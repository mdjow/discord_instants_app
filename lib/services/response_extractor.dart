Map<String, dynamic> extractResponse(Map<String, dynamic> response) {
  return _accessSafely(response, "data");
}

Map<String, dynamic> _accessSafely(Map<String, dynamic> value, String key) {
  if (value?.isEmpty ?? true) {
    return {};
  }

  if (!value.containsKey(key)) {
    return {};
  }

  return value[key] as Map<String, dynamic>;
}

List<dynamic> extractListResponse(Map<String, dynamic> response) {
  return _accessListSafely(response, "data");
}

List<dynamic> _accessListSafely(Map<String, dynamic> value, String key) {
  if (value?.isEmpty ?? true) {
    return [];
  }

  if (!value.containsKey(key)) {
    return [];
  }

  final res = value[key] is List ? value[key] : [];
  return res;
}
