import 'package:equatable/equatable.dart';

class Device extends Equatable {
  final bool? mobile;
  final bool? web;

  const Device({this.mobile, this.web});

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        mobile: json['mobile'] as bool?,
        web: json['web'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'web': web,
      };

  Device copyWith({
    bool? mobile,
    bool? web,
  }) {
    return Device(
      mobile: mobile ?? this.mobile,
      web: web ?? this.web,
    );
  }

  @override
  List<Object?> get props => [mobile, web];
}
