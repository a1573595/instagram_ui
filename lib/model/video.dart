class Video {
  const Video({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  final String description;
  final List<String> sources;
  final String subtitle;
  final String thumb;
  final String title;
}
