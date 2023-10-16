import 'package:intl/intl.dart';
import 'package:luckuveryx/features/projects/projects.dart';

const _googlePlay = 'Google Play';
const _appStore = 'App Store';
const _gitHub = 'GitHub';
const _website = 'Website';
const _testFlight = 'TestFlight';

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
    if (endDate == null) return start;
    return '$start - ${dateFormat.format(endDate!)}';
  }

  static List<Project> get values => [
        Glints(),
        Portfolio(),
        Evlve(),
        Osim(),
        Scratchbac(),
        VjChoirArchives(),
        BubuDex(),
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
              label: _appStore,
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.glints.candidate',
              ),
              label: _googlePlay,
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
              label: _appStore,
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.osim.oneapp&hl=en&gl=US',
              ),
              label: _googlePlay,
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
              label: _appStore,
            ),
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.scratchbac.baladi',
              ),
              label: _googlePlay,
            ),
          ],
        );
}

class Portfolio extends Project {
  Portfolio()
      : super._(
          title: 'Portfolio',
          url: Uri.parse('https://luckuveryx.github.io'),
          startDate: DateTime(2023, 10),
          endDate: null,
          links: [
            Link(
              url: Uri.parse(
                'https://luckuveryx.github.io',
              ),
              label: _website,
            ),
            Link(
              url: Uri.parse(
                'https://github.com/LuckUVeryX/luckuveryx.github.io',
              ),
              label: _gitHub,
            ),
          ],
        );
}

class Evlve extends Project {
  Evlve()
      : super._(
          title: 'Evlve MMA',
          url: Uri.parse('https://evolve-mma.com/'),
          startDate: DateTime(2023, 5),
          endDate: null,
          links: [
            Link(
              url: Uri.parse(
                'https://play.google.com/store/apps/details?id=com.evolve.evlve',
              ),
              label: _googlePlay,
            ),
            Link(
              url: Uri.parse(
                'https://testflight.apple.com/join/eS0JF0F1',
              ),
              label: _testFlight,
            ),
            Link(
              url: Uri.parse(
                'https://github.com/LuckUVeryX/evlve',
              ),
              label: _gitHub,
            ),
          ],
        );
}

class VjChoirArchives extends Project {
  VjChoirArchives()
      : super._(
          title: 'VJ Choir Archives',
          url: Uri.parse('https://github.com/LuckUVeryX/vjchoir_archives'),
          startDate: DateTime(2022, 9),
          endDate: null,
          links: [
            Link(
              url: Uri.parse(
                'https://github.com/LuckUVeryX/vjchoir_archives',
              ),
              label: _gitHub,
            ),
          ],
        );
}

class BubuDex extends Project {
  BubuDex()
      : super._(
          title: 'Bubudex',
          url: Uri.parse('https://github.com/LuckUVeryX/bubudex'),
          startDate: DateTime(2021, 10),
          endDate: null,
          links: [
            Link(
              url: Uri.parse(
                'https://github.com/LuckUVeryX/bubudex',
              ),
              label: _gitHub,
            ),
          ],
        );
}
