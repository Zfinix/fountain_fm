import 'package:fountain_fm/core/fountain_api/src/models/podcast_model.dart';

/// {@template lighthouse_api_client}
/// Dart API Client which wraps the [FountainApi()].
/// {@endtemplate}
class ApiClient {
  final podcasts = {
    'show': {
      'title': 'Podcasting 2.0',
      'publisher': 'Podcast Index LLC',
      'image': 'https://api.podcastindex.org/images/pci_avatar.jpg',
      'description':
          'The Podcast Index presents Podcasting 2.0 - Upgrading Podcasting',
      'link': 'https://podcastindex.org',
      'following': false,
    }
  };

  /// Get Podcast Model
  Future<PodcastModel> getPodcasts() async {
    /// Artificial Network request
    await Future.delayed(
      const Duration(
        seconds: 0,
      ),
    );

    return PodcastModel.fromMap(podcasts);
  }
}
