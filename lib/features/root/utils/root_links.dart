import 'package:url_launcher/url_launcher.dart';

enum RootLink { gitHub, linkedIn, project }

extension RootLinkX on RootLink {
  Uri get uri {
    return switch (this) {
      RootLink.gitHub => Uri.parse('https://github.com/LuckUVeryX'),
      RootLink.linkedIn =>
        Uri.parse('https://www.linkedin.com/in/ryan-yip-luckuveryx/'),
      RootLink.project =>
        Uri.parse('https://github.com/LuckUVeryX/luckuveryx.github.io'),
    };
  }

  void launch() => launchUrl(uri);
}
