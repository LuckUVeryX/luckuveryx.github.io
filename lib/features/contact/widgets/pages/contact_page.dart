import 'package:flutter/material.dart';
import 'package:luckuveryx/features/info/info.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: InfoLinkButton(
          link: InfoLink(
            label: 'Contact Me',
            url: Uri(
              scheme: 'mailto',
              path: 'luckuveryx@icloud.com',
            ),
          ),
        ),
      ),
    );
  }
}
