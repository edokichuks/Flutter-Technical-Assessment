import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
	final String? email;
	final String? password;

	const LoginModel({this.email, this.password});

	factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
				email: json['email'] as String?,
				password: json['password'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
				'password': password,
			};

	LoginModel copyWith({
		String? email,
		String? password,
	}) {
		return LoginModel(
			email: email ?? this.email,
			password: password ?? this.password,
		);
	}

	@override
	List<Object?> get props => [email, password];
}
