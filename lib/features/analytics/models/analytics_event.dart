import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.freezed.dart';

@freezed
class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent({
    required String eventName,
    Map<String, dynamic>? properties,
  }) = _AnalyticsEvent;

  factory AnalyticsEvent.contactMeTapped() {
    return const AnalyticsEvent(eventName: 'contact_me_tapped');
  }

  factory AnalyticsEvent.githubViewed() {
    return const AnalyticsEvent(eventName: 'github_iewed');
  }

  factory AnalyticsEvent.linkedInViewed() {
    return const AnalyticsEvent(eventName: 'linkedin_viewed');
  }

  factory AnalyticsEvent.locationViewed() {
    return const AnalyticsEvent(eventName: 'location_viewed');
  }

  factory AnalyticsEvent.projectLinkTapped(Uri uri) {
    return AnalyticsEvent(
      eventName: 'project_link_tapped',
      properties: {'link': uri},
    );
  }

  factory AnalyticsEvent.projectSubLinkTapped(Uri uri) {
    return AnalyticsEvent(
      eventName: 'project_sublink_tapped',
      properties: {'link': uri},
    );
  }

  factory AnalyticsEvent.resumeViewed() {
    return const AnalyticsEvent(eventName: 'resume_viewed');
  }

  factory AnalyticsEvent.themeModeToggled(ThemeMode themeMode) {
    return AnalyticsEvent(
      eventName: 'theme_mode_toggled',
      properties: {'theme_mode': themeMode.name},
    );
  }

  const AnalyticsEvent._();
}
