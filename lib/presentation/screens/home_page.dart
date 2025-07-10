import 'package:flutter/material.dart';

/// Data model for Bible verse content and reference
class BibleVerse {
  final String text;
  final String reference;

  const BibleVerse({required this.text, required this.reference});
}

/// Data model for user profile information displayed in header
class UserProfile {
  final String name;
  final String profileImagePath;
  final String greeting;

  const UserProfile({
    required this.name,
    required this.profileImagePath,
    required this.greeting,
  });
}

/// Data model for daily prayer session information
class DailyPrayer {
  final String title;
  final String type;
  final String description;

  const DailyPrayer({
    required this.title,
    required this.type,
    required this.description,
  });
}

/// Main home page displaying user profile, daily Bible verse, and prayer section
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Sample user data - in production this would come from a data source
  static const UserProfile _userProfile = UserProfile(
    name: 'Hashel Theertha!',
    profileImagePath: 'assets/images/profile/dummy-proile.png',
    greeting: 'Good Morning',
  );

  // Sample daily verse - in production this would be fetched from an API
  static const BibleVerse _dailyVerse = BibleVerse(
    text:
        'What shall we say then? Shall we go on sinning so that grace may increase? By no means! We died to sin; how can we live in it any longer?',
    reference: 'Romans 6:1',
  );

  // Sample prayer data - in production this would be dynamic based on the day
  static const DailyPrayer _dailyPrayer = DailyPrayer(
    title: 'Daily Prayer',
    type: 'Rosary',
    description: 'Join in the daily rosary prayer',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(context),
      body: SafeArea(child: _buildScrollableContent()),
    );
  }

  /// Returns appropriate background color based on current theme (light/dark)
  Color _getBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF5F5F5);
  }

  /// Creates scrollable content with profile header, Bible verse, and prayer sections
  Widget _buildScrollableContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _ProfileHeader(profile: _userProfile),
            const SizedBox(height: 30),
            _DailyBibleVerseSection(verse: _dailyVerse),
            const SizedBox(height: 30),
            _DailyPrayerSection(prayer: _dailyPrayer),
            const SizedBox(height: 100), // Extra space above bottom navigation
          ],
        ),
      ),
    );
  }
}

/// Header section displaying user profile image, greeting, and notification icon
class _ProfileHeader extends StatelessWidget {
  final UserProfile profile;

  const _ProfileHeader({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildProfileImage(),
        const SizedBox(width: 16),
        _buildGreetingSection(context),
        const Spacer(),
        _buildNotificationIcon(context),
      ],
    );
  }

  /// Creates circular profile image with blue border and fallback handling
  Widget _buildProfileImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF2196F3), width: 2),
      ),
      child: ClipOval(
        child: Image.asset(
          profile.profileImagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackAvatar();
          },
        ),
      ),
    );
  }

  /// Creates default avatar icon when profile image fails to load
  Widget _buildFallbackAvatar() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF2196F3),
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 30),
    );
  }

    /// Creates greeting text section with time-based greeting and user name
  Widget _buildGreetingSection(BuildContext context) {
    final textColor = _getTextColor(context);
    
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${profile.greeting},',
            style: TextStyle(
              fontSize: 16,
              color: textColor.withValues(alpha: 0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Creates notification bell icon with green active indicator dot
  Widget _buildNotificationIcon(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: _getTextColor(context),
            size: 24,
          ),
        ),
        // Green dot indicating active notifications
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  /// Returns text color that adapts to current theme (light/dark)
  Color _getTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black87;
  }
}

/// Section displaying daily Bible verse with decorative header and styled card
class _DailyBibleVerseSection extends StatelessWidget {
  final BibleVerse verse;

  const _DailyBibleVerseSection({required this.verse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader(context),
        const SizedBox(height: 16),
        _buildVerseCard(context),
      ],
    );
  }

  /// Creates section title with gradient decorative lines on both sides
  Widget _buildSectionHeader(BuildContext context) {
    final textColor = _getTextColor(context);
    
    return Row(
      children: [
        _buildLine(direction: 'left'),
        const SizedBox(width: 12),
        Text(
          'Daily Bible Verse',
          style: TextStyle(
            fontSize: 16,
            color: textColor.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        _buildLine(direction: 'right'),
      ],
    );
  }

    /// Creates bordered card containing Bible verse text and reference
  Widget _buildVerseCard(BuildContext context) {
    final textColor = _getTextColor(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xFF2196F3), width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            verse.text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.w400,
              height: 1.5, // Line height for better readability
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '~ ${verse.reference}',
            style: TextStyle(
              fontSize: 14,
              color: textColor.withValues(alpha: 0.7),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// Returns text color that adapts to current theme (light/dark)
  Color _getTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black87;
  }
}

/// Creates horizontal gradient line that fades from transparent to grey or vice versa
/// Used for decorative section headers throughout the app
Widget _buildLine({required String direction}) {
  return Expanded(
    child: Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: direction == 'left'
              ? [Colors.transparent, Colors.grey.withValues(alpha: 0.3)]
              : [Colors.grey.withValues(alpha: 0.3), Colors.transparent],
          stops: const [0.0, 1.0],
        ),
      ),
    ),
  );
}

/// Section for daily prayer with interactive card and action button
class _DailyPrayerSection extends StatelessWidget {
  final DailyPrayer prayer;

  const _DailyPrayerSection({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionHeader(context),
        const SizedBox(height: 16),
        _buildPrayerCard(context),
      ],
    );
  }

  /// Creates section header showing prayer title and type with decorative lines
  Widget _buildSectionHeader(BuildContext context) {
    final textColor = _getTextColor(context);
    
    return Row(
      children: [
        _buildLine(direction: 'left'),
        const SizedBox(width: 12),
        Text(
          '${prayer.title}: ${prayer.type}',
          style: TextStyle(
            fontSize: 16,
            color: textColor.withValues(alpha: 0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        _buildLine(direction: 'right'),
      ],
    );
  }

    /// Creates prayer card with heart icon, title, description and action button
  Widget _buildPrayerCard(BuildContext context) {
    final textColor = _getTextColor(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.favorite, color: const Color(0xFF2196F3), size: 32),
          const SizedBox(height: 12),
          Text(
            prayer.type,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            prayer.description,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          _buildPrayButton(context),
        ],
      ),
    );
  }

  /// Creates blue action button that will navigate to prayer page when implemented
  Widget _buildPrayButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Navigate to rosary prayer page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Rosary prayer page coming soon!'),
            backgroundColor: Color(0xFF2196F3),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: const Text(
        'Pray Now',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  /// Returns text color that adapts to current theme (light/dark)
  Color _getTextColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.white : Colors.black87;
  }
}
