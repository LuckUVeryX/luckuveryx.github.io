import 'package:url_launcher/url_launcher.dart';

enum UrlLink { gitHub, linkedIn, project }

extension UrlLinkX on UrlLink {
  Uri get uri {
    return switch (this) {
      UrlLink.gitHub => Uri.parse('https://github.com/LuckUVeryX'),
      UrlLink.linkedIn =>
        Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
      UrlLink.project =>
        Uri.parse('https://github.com/LuckUVeryX/luckuveryx.github.io'),
    };
  }

  void launch() => launchUrl(uri);
}
