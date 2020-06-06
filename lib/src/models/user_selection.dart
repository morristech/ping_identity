import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ping_identity/ping_identity.dart';
import 'package:ping_identity/src/models/ping_identity_action_type.dart';

part 'user_selection.g.dart';

@JsonSerializable()
class UserSelection extends Equatable {
  final PingIdentityActionType actionType;
  final PingIdentityTrustLevel trustLevel;

  UserSelection({
    this.actionType,
    this.trustLevel,
  });

  @override
  List<Object> get props => [];

  factory UserSelection.fromJson(Map<String, dynamic> json) =>
      _$UserSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$UserSelectionToJson(this);
}
