import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_details.g.dart';

@JsonSerializable()
class DeviceDetails extends Equatable {
  final String name;

  DeviceDetails({this.name});

  @override
  List<Object> get props => [name];

  factory DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceDetailsToJson(this);
}
