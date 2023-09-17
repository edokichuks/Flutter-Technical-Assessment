import 'package:equatable/equatable.dart';

class Deleted extends Equatable {
  final bool? status;
  final String? reason;

  const Deleted({this.status, this.reason});

  factory Deleted.fromJson(Map<String, dynamic> json) => Deleted(
        status: json['status'] as bool?,
        reason: json['reason'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'reason': reason,
      };

  Deleted copyWith({
    bool? status,
    String? reason,
  }) {
    return Deleted(
      status: status ?? this.status,
      reason: reason ?? this.reason,
    );
  }

  @override
  List<Object?> get props => [status, reason];
}
