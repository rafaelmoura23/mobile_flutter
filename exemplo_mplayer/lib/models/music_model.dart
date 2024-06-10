class MusicModel {
  final String title;
  final String url;
  final String artist;

  // construtor
  MusicModel({required this.title, required this.url, required this.artist});

  // fromJson
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      title: json['title'],
      url: json['url'],
      artist: json['artist'],
    );
  }
}