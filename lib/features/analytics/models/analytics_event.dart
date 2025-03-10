import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_event.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class AnalyticsEvent with _$AnalyticsEvent {
  const factory AnalyticsEvent({
    required String eventName,
    Map<String, Object>? properties,
  }) = _AnalyticsEvent;

  factory AnalyticsEvent.contactMeTapped() {
    return const AnalyticsEvent(eventName: 'contact_me_tapped');
  }

  factory AnalyticsEvent.githubViewed() {
    return const AnalyticsEvent(eventName: 'github_viewed');
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
      properties: {'link': uri.toString()},
    );
  }

  factory AnalyticsEvent.projectSubLinkTapped(Uri uri) {
    return AnalyticsEvent(
      eventName: 'project_sublink_tapped',
      properties: {'link': uri.toString()},
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

  factory AnalyticsEvent.speedSliderValue(double speed) {
    return AnalyticsEvent(
      eventName: 'speed_slider_value',
      properties: {'speed': speed},
    );
  }

  factory AnalyticsEvent.sizeSliderValue(double size) {
    return AnalyticsEvent(
      eventName: 'size_slider_value',
      properties: {'size': size},
    );
  }

  factory AnalyticsEvent.cornerAnimationManuallyTriggered() {
    return const AnalyticsEvent(
      eventName: 'corner_animation_manually_triggered',
    );
  }

  factory AnalyticsEvent.cornerDetected() {
    return const AnalyticsEvent(eventName: 'corner_detected');
  }

  const AnalyticsEvent._();
}
