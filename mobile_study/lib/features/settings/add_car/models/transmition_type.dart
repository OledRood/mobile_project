enum TransmissionType {
  automatic,
  manual,
  robot,
  variator;

  String get label {
    switch (this) {
      case automatic:
        return "Автомат";
      case manual:
        return "Механика";
      case robot:
        return "Робот";
      case variator:
        return "Вариатор";
    }
  }
}
