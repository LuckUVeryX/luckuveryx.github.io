import 'package:url_launcher/url_launcher.dart';

enum HomeLink { gitHub, linkedIn, project }

extension HomeLinkX on HomeLink {
  Uri get uri {
    return switch (this) {
      HomeLink.gitHub => Uri.parse('https://github.com/LuckUVeryX'),
      HomeLink.linkedIn =>
        Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
      HomeLink.project =>
        Uri.parse('https://github.com/LuckUVeryX/luckuveryx.github.io'),
    };
  }

  void launch() => launchUrl(uri);
}
