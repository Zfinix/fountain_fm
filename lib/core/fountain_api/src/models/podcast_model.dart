import 'dart:convert';

import 'package:equatable/equatable.dart';

class PodcastModel with EquatableMixin {
  final Show show;
  const PodcastModel({
    required this.show,
  });

  PodcastModel copyWith({
    Show? show,
  }) {
    return PodcastModel(
      show: show ?? this.show,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'show': show.toMap(),
    };
  }

  factory PodcastModel.fromMap(Map<String, dynamic> map) {
    return PodcastModel(
      show: Show.fromMap(map['show']),
    );
  }
  static const empty = PodcastModel(show: Show.empty);

  String toJson() => json.encode(toMap());

  factory PodcastModel.fromJson(String source) =>
      PodcastModel.fromMap(json.decode(source));

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [show];
}

class Show with EquatableMixin {
  final String title;
  final String publisher;
  final String image;
  final String description;
  final String link;
  final bool following;

  const Show({
    required this.title,
    required this.publisher,
    required this.image,
    required this.description,
    required this.link,
    required this.following,
  });

  Show copyWith({
    String? title,
    String? publisher,
    String? image,
    String? description,
    String? link,
    bool? following,
  }) {
    return Show(
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      image: image ?? this.image,
      description: description ?? this.description,
      link: link ?? this.link,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'publisher': publisher,
      'image': image,
      'description': description,
      'link': link,
      'following': following,
    };
  }

  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      title: map['title'],
      publisher: map['publisher'],
      image: map['image'],
      description: map['description'],
      link: map['link'],
      following: map['following'],
    );
  }

  static const empty = Show(
    title: '',
    publisher: '',
    image: '',
    description: '',
    link: '',
    following: false,
  );

  String toJson() => json.encode(toMap());

  factory Show.fromJson(String source) => Show.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      title,
      publisher,
      image,
      description,
      link,
      following,
    ];
  }
}
