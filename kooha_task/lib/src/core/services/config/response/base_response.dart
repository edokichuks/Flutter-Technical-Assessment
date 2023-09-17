import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> extends Equatable {
  final T? data;
  @JsonKey(name: "success")
  final bool status;
  final String? message;

  const BaseResponse({
    this.data,
    required this.status,
    this.message,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: null,
      status: json['success'] ?? false,
      message: json['message'] ?? 'Error',
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [status, message, data];
}
