import 'package:flutter/material.dart';
import 'package:luckuveryx/features/experiences/widgets/organisms/experiences_list_item.dart';
import 'package:luckuveryx/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

part 'glints_experience.dart';

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
          onPressed: _onPressed,
        );
  }
}
