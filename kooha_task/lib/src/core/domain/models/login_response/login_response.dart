import 'package:equatable/equatable.dart';

import 'profile.dart';

class LoginResponse extends Equatable {
  final String? token;
  final Profile? profile;

  const LoginResponse({this.token, this.profile});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'] as String?,
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'profile': profile?.toJson(),
      };

  LoginResponse copyWith({
    String? token,
    Profile? profile,
  }) {
    return LoginResponse(
      token: token ?? this.token,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [token, profile];
}
