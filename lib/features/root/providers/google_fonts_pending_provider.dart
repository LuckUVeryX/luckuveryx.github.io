import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_fonts_pending_provider.g.dart';

@riverpod
Future<void> googleFontsPending(GoogleFontsPendingRef ref) {
  return GoogleFonts.pendingFonts();
}
