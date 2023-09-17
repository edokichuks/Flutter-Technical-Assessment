import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
	final String? uuid;
	final String? fullName;
	final String? userName;
	final String? email;
	final String? type;
	final String? token;
	final bool? activeNotification;

	const LoginResponse({
		this.uuid, 
		this.fullName, 
		this.userName, 
		this.email, 
		this.type, 
		this.token, 
		this.activeNotification, 
	});

	factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
				uuid: json['uuid'] as String?,
				fullName: json['fullName'] as String?,
				userName: json['userName'] as String?,
				email: json['email'] as String?,
				type: json['type'] as String?,
				token: json['token'] as String?,
				activeNotification: json['activeNotification'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'uuid': uuid,
				'fullName': fullName,
				'userName': userName,
				'email': email,
				'type': type,
				'token': token,
				'activeNotification': activeNotification,
			};

	LoginResponse copyWith({
		String? uuid,
		String? fullName,
		String? userName,
		String? email,
		String? type,
		String? token,
		bool? activeNotification,
	}) {
		return LoginResponse(
			uuid: uuid ?? this.uuid,
			fullName: fullName ?? this.fullName,
			userName: userName ?? this.userName,
			email: email ?? this.email,
			type: type ?? this.type,
			token: token ?? this.token,
			activeNotification: activeNotification ?? this.activeNotification,
		);
	}

	@override
	List<Object?> get props {
		return [
				uuid,
				fullName,
				userName,
				email,
				type,
				token,
				activeNotification,
		];
	}
}
