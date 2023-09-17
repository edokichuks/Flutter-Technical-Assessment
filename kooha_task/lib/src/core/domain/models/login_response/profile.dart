import 'package:equatable/equatable.dart';

import 'deleted.dart';
import 'device.dart';

class Profile extends Equatable {
  final Device? device;
  final Deleted? deleted;
  final bool? status;
  final String? photo;
  final String? gender;
  final String? ageRange;
  final bool? emailVisibility;
  final String? phoneNumber;
  final bool? phoneNumberVisibility;
  final String? language;
  final String? bio;
  final bool? isAcceptTalkRule;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? country;
  final String? type;
  final String? role;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? userNumber;
  final int? v;
  final String? state;

  const Profile({
    this.device,
    this.deleted,
    this.status,
    this.photo,
    this.gender,
    this.ageRange,
    this.emailVisibility,
    this.phoneNumber,
    this.phoneNumberVisibility,
    this.language,
    this.bio,
    this.isAcceptTalkRule,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.country,
    this.type,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.userNumber,
    this.v,
    this.state,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        device: json['device'] == null
            ? null
            : Device.fromJson(json['device'] as Map<String, dynamic>),
        deleted: json['deleted'] == null
            ? null
            : Deleted.fromJson(json['deleted'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        photo: json['photo'] as String?,
        gender: json['gender'] as String?,
        ageRange: json['age_range'] as String?,
        emailVisibility: json['email_visibility'] as bool?,
        phoneNumber: json['phone_number'] as String?,
        phoneNumberVisibility: json['phone_number_visibility'] as bool?,
        language: json['language'] as String?,
        bio: json['bio'] as String?,
        isAcceptTalkRule: json['is_accept_talk_rule'] as bool?,
        id: json['_id'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        country: json['country'] as String?,
        type: json['type'] as String?,
        role: json['role'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        userNumber: json['user_number'] as int?,
        v: json['__v'] as int?,
        state: json['state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'device': device?.toJson(),
        'deleted': deleted?.toJson(),
        'status': status,
        'photo': photo,
        'gender': gender,
        'age_range': ageRange,
        'email_visibility': emailVisibility,
        'phone_number': phoneNumber,
        'phone_number_visibility': phoneNumberVisibility,
        'language': language,
        'bio': bio,
        'is_accept_talk_rule': isAcceptTalkRule,
        '_id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'country': country,
        'type': type,
        'role': role,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'user_number': userNumber,
        '__v': v,
        'state': state,
      };

  Profile copyWith({
    Device? device,
    Deleted? deleted,
    bool? status,
    String? photo,
    String? gender,
    String? ageRange,
    bool? emailVisibility,
    String? phoneNumber,
    bool? phoneNumberVisibility,
    String? language,
    String? bio,
    bool? isAcceptTalkRule,
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? country,
    String? type,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userNumber,
    int? v,
    String? state,
  }) {
    return Profile(
      device: device ?? this.device,
      deleted: deleted ?? this.deleted,
      status: status ?? this.status,
      photo: photo ?? this.photo,
      gender: gender ?? this.gender,
      ageRange: ageRange ?? this.ageRange,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumberVisibility:
          phoneNumberVisibility ?? this.phoneNumberVisibility,
      language: language ?? this.language,
      bio: bio ?? this.bio,
      isAcceptTalkRule: isAcceptTalkRule ?? this.isAcceptTalkRule,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      country: country ?? this.country,
      type: type ?? this.type,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userNumber: userNumber ?? this.userNumber,
      v: v ?? this.v,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props {
    return [
      device,
      deleted,
      status,
      photo,
      gender,
      ageRange,
      emailVisibility,
      phoneNumber,
      phoneNumberVisibility,
      language,
      bio,
      isAcceptTalkRule,
      id,
      firstName,
      lastName,
      email,
      country,
      type,
      role,
      createdAt,
      updatedAt,
      userNumber,
      v,
      state,
    ];
  }
}
