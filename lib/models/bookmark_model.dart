import 'package:equatable/equatable.dart';
import 'package:fabrikod_quran/constants/constants.dart';
import 'package:fabrikod_quran/models/verse_model.dart';

class BookMarkModel extends Equatable {
  final EBookMarkType bookMarkType;
  final VerseModel verseModel;

  const BookMarkModel({required this.bookMarkType, required this.verseModel});

  factory BookMarkModel.fromJson(Map<String, dynamic> json) => BookMarkModel(
        bookMarkType: EBookMarkType.values[json['bookMarkType'] as int],
        verseModel: VerseModel.fromJson(json['verseModel']),
      );

  Map<String, dynamic> toJson() => {
        'bookMarkType': bookMarkType.index,
        'verseModel': verseModel.toJson(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [bookMarkType, verseModel.verseKey];
}
