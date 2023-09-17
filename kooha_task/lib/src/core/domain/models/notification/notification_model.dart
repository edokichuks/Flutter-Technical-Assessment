import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:equatable/equatable.dart';
import 'metadata.dart';
import 'package:talkam/src/core/routers/route_generator.dart';

class NotificationModel extends Equatable {
  final String? title;
  final String? description;
  final String? deviceId;
  final String? type;
  final String? typeId;
  final Metadata? metadata;

  const NotificationModel(
      {this.title,
      this.description,
      this.deviceId,
      this.metadata,
      this.type,
      this.typeId});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        type: json['type'] == null ? null : json['type'],
        typeId: json['type_id'] == null ? null : json['type_id'],
      );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'device_id': deviceId,
      'metadata': metadata
    };
  }

  NotificationModel copyWith(
      {String? title,
      String? description,
      String? deviceId,
      Metadata? metadata}) {
    return NotificationModel(
        title: title ?? this.title,
        description: description ?? this.description,
        deviceId: deviceId ?? this.deviceId,
        metadata: metadata ?? this.metadata);
  }

  handleNotificationaMessage(
      RemoteMessage? notification, BuildContext context) {
    if (notification != null) {
      final data = notification.data;
      final NotificationModel message = NotificationModel.fromJson(data);
      switch (message.type) {
        case 'talk':
          Navigator.pushNamed(
            context,
            RouteGenerator.kSinglePostcreen,
            arguments: message.typeId,
          );
          break;
        case 'media':
          Navigator.pushNamed(
            context,
            RouteGenerator.kMediaScreen,
            arguments: false,
          );
          break;
        case 'courses':
          Navigator.pushNamed(
            context,
            RouteGenerator.kCourse,
            arguments: true,
          );
          break;
        default:
          null;
      }
    }
  }

  @override
  List<Object?> get props => [title, description, deviceId, metadata];
}
