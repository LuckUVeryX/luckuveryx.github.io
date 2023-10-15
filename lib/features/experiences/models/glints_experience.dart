part of 'experience.dart';

class GlintsExperience extends Experience {
  @override
  String _companyOf(BuildContext context) {
    return context.l10n.experienceGlints;
  }

  @override
  String _bodyOf(BuildContext context) {
    return context.l10n.experienceGlintsBody;
  }

  @override
  String _dateOf(BuildContext context) {
    return context.l10n.experienceGlintsDate;
  }

  @override
  VoidCallback _onPressed() {
    return () => launchUrl(Uri.parse('https://glints.com'));
  }

  @override
  String _roleOf(BuildContext context) {
    return context.l10n.experienceGlintsRole;
  }

  @override
  List<String> _skillsOf(BuildContext context) {
    return [
      context.l10n.skillGraphQL,
      context.l10n.skillMelos,
      context.l10n.skillCodemagic,
      context.l10n.skillRiverpod,
      context.l10n.skillFlutterHooks,
    ];
  }
}
