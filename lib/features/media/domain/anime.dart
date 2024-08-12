import 'package:animex/features/media/domain/Media.dart';

abstract class Anime extends Media {
  Anime({required super.title, required super.description, required super.imageCoverUrl, required super.coverUrl, required super.year});

}
