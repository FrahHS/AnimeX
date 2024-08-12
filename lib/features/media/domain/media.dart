abstract class Media {
  const Media({required this.title, required this.description, required this.imageCoverUrl, required this.coverUrl, required this.year});

  final String title;
  final String description;
  final Uri imageCoverUrl;
  final Uri coverUrl;
  final String year;
}
