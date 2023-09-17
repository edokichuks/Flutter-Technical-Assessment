import 'package:equatable/equatable.dart';

class Metadata extends Equatable {
  final String? type;
  final String? typeId;
  const Metadata({this.type, this.typeId});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        type: json['type'],
        typeId: json['type_id'],
      );

  Map<String, dynamic> toJson() {
    return {'type': type, 'type_id': typeId};
  }

  Metadata copyWith({
    String? type,
    String? typeId,
  }) {
    return Metadata(
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
    );
  }

  @override
  List<Object?> get props => [type, typeId];
}
