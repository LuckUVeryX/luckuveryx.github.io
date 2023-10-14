import 'package:flutter/material.dart';
import 'package:luckuveryx/utils/theme_extensions.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class StyledRichText extends StatelessWidget {
  const StyledRichText({
    required this.text,
    this.style,
    this.tags,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Map<String, StyledTextTagBase>? tags;

  void _onLinkTap(String? text, Map<String?, String?> attrs) {
    final link = attrs['href'];
    if (link == null) return;
    launchUrl(Uri.parse(link));
  }

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.textTheme.bodyMedium;

    return StyledText(
      text: text,
      style: style,
      tags: {
        ...?tags,
        'b': StyledTextTag(
          style: style?.copyWith(fontWeight: FontWeight.bold),
        ),
        'link': StyledTextActionTag(
          _onLinkTap,
          style: style?.copyWith(fontWeight: FontWeight.bold),
        ),
      },
    );
  }
}
