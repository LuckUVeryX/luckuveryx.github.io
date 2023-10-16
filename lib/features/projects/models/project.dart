import 'package:intl/intl.dart';
import 'package:luckuveryx/features/projects/projects.dart';

sealed class Project {
  const Project._({
    required this.title,
    required this.url,
    required this.startDate,
    required this.endDate,
    required this.links,
  });

  final String title;
  final Uri url;
  final DateTime startDate;
  final DateTime? endDate;
  final List<Link> links;

  String dateString() {
    final dateFormat = DateFormat.yMMM();
    final start = dateFormat.format(startDate);
    if (endDate == null) return '$start - Present';
    return '$start - ${dateFormat.format(endDate!)}';
  }

  static List<Project> get values => [
        Glints(),
        Osim(),
        Scratchbac(),
      ];
}

class Glints extends Project {
  Glints()
      : super._(
          title: 'Glints',
          url: Uri.parse('https://glints.com'),
          startDate: DateTime(2022, 10),
          endDate: null,
          links: [
            Link(
              url: Uri.parse(
                'https://apps.apple.com/us/app/glints-jobs-chat-hr-career/id1613169954',
              ),
              label: 'AppStore',
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.glints.candidate',
              ),
              label: 'Google Play',
            ),
          ],
        );
}

class Osim extends Project {
  Osim()
      : super._(
          title: 'Osim',
          url: Uri.parse('https://sg.osim.com'),
          startDate: DateTime(2021, 11),
          endDate: DateTime(2022, 10),
          links: [
            Link(
              url: Uri.parse(
                'https://apps.apple.com/sg/app/osim-well-being/id1588337384',
              ),
              label: 'AppStore',
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.osim.oneapp&hl=en&gl=US',
              ),
              label: 'Google Play',
            ),
          ],
        );
}

class Scratchbac extends Project {
  Scratchbac()
      : super._(
          title: 'Scratchbac',
          url: Uri.parse('https://www.scratchbac.com'),
          startDate: DateTime(2020, 9),
          endDate: DateTime(2021, 11),
          links: [
            Link(
              url: Uri.parse(
                'https://apps.apple.com/sg/app/scratchbac/id1587462661',
              ),
              label: 'AppStore',
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.scratchbac.baladi',
              ),
              label: 'Google Play',
            ),
          ],
        );
}
