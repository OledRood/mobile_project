import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum RentStatus {
  active('active'),
  completed("completed"),
  cancelled('cancelled');

  final String value;

  const RentStatus(this.value);
  String toJson() => name;
  static RentStatus fromJson(String value) {
    return RentStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid RentStatus value: $value'),
    );
  }
}
