mixin ValidatorMixin {
  String? validatorName(String? value) {
    if (value == null || value.isEmpty || value.length < 3) {
      return "Minimum üç karakter giriniz";
    }
    return null;
  }

  String? validatorNote(String? value) {
    if (value == null || value.isEmpty) {
      return "Not alanı boş bırakılamaz";
    }

    int? not;
    try {
      not = int.parse(value);
    } catch (e) {
      return "Geçerli bir not giriniz";
    }

    if (not < 0 || not > 100) {
      return "Lütfen geçerli bir değer girin";
    }
    return null;
  }
}
