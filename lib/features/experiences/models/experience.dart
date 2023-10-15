import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/experiences.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class Experience {
  const Experience();

  String _dateOf(BuildContext context);
  String _companyOf(BuildContext context);
  String _roleOf(BuildContext context);
  String _bodyOf(BuildContext context);
  List<String> _skillsOf(BuildContext context);
  VoidCallback _onPressed();

  WidgetBuilder toItem() {
    return (context) => ExperiencesListItem(
          date: _dateOf(context),
          company: _companyOf(context),
          role: _roleOf(context),
          body: _bodyOf(context),
          skills: _skillsOf(context),
          onPressed: _onPressed(),
        );
  }

  static List<Experience> call() {
    return [
      const GlintsExperience(),
      const OsimExperience(),
      const ScratchBacExperience(),
    ];
  }
}

class GlintsExperience extends Experience {
  const GlintsExperience();
  @override
  String _companyOf(BuildContext context) => context.l10n.experienceGlints;

  @override
  String _bodyOf(BuildContext context) => context.l10n.experienceGlintsBody;

  @override
  String _dateOf(BuildContext context) => context.l10n.experienceGlintsDate;

  @override
  VoidCallback _onPressed() => () => launchUrl(Uri.parse('https://glints.com'));

  @override
  String _roleOf(BuildContext context) => context.l10n.experienceGlintsRole;

  @override
  List<String> _skillsOf(BuildContext context) {
    return [
      context.l10n.skillGraphQL,
      context.l10n.skillMelos,
      context.l10n.skillCICD,
      context.l10n.skillCodemagic,
      context.l10n.skillRiverpod,
      context.l10n.skillFlutterHooks,
      context.l10n.skillRxDart,
    ];
  }
}

class OsimExperience extends Experience {
  const OsimExperience();
  @override
  String _companyOf(BuildContext context) => context.l10n.experienceOsim;

  @override
  String _bodyOf(BuildContext context) => context.l10n.experienceOsimBody;

  @override
  String _dateOf(BuildContext context) => context.l10n.experienceOsimDate;

  @override
  VoidCallback _onPressed() =>
      () => launchUrl(Uri.parse('https://sg.osim.com'));

  @override
  String _roleOf(BuildContext context) => context.l10n.experienceOsimRole;

  @override
  List<String> _skillsOf(BuildContext context) {
    return [
      context.l10n.skillIot,
      context.l10n.skillUml,
      context.l10n.skillCICD,
      context.l10n.skillProvider,
      context.l10n.skillFastlane,
      context.l10n.skillGithubActions,
      context.l10n.skillAppCenter,
    ];
  }
}

class ScratchBacExperience extends Experience {
  const ScratchBacExperience();
  @override
  String _companyOf(BuildContext context) => context.l10n.experienceSB;

  @override
  String _bodyOf(BuildContext context) => context.l10n.experienceSBBody;

  @override
  String _dateOf(BuildContext context) => context.l10n.experienceSBDate;

  @override
  VoidCallback _onPressed() =>
      () => launchUrl(Uri.parse('https://www.scratchbac.com'));

  @override
  String _roleOf(BuildContext context) => context.l10n.experienceSBRole;

  @override
  List<String> _skillsOf(BuildContext context) {
    return [
      context.l10n.skillGeolocation,
      context.l10n.skillFirebase,
      context.l10n.skillREST,
      context.l10n.skillNotion,
      context.l10n.skillGetX,
      context.l10n.skillFastlane,
      context.l10n.skillGithubActions,
    ];
  }
}
