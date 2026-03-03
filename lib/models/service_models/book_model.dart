import 'package:polyread/models/dto_models/library_dto_models/library_book_model.dart';

class Books {
  Books({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result> results;

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results.map((x) => x.toJson()).toList(),
  };
}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.editors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  final int? id;
  final String? title;
  final List<Author> authors;
  final List<String> summaries;
  final List<dynamic> editors;
  final List<dynamic> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool? copyright;
  final String? mediaType;
  final Formats? formats;
  final int? downloadCount;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"],
      title: json["title"],
      authors: json["authors"] == null
          ? []
          : List<Author>.from(json["authors"]!.map((x) => Author.fromJson(x))),
      summaries: json["summaries"] == null
          ? []
          : List<String>.from(json["summaries"]!.map((x) => x)),
      editors: json["editors"] == null
          ? []
          : List<dynamic>.from(json["editors"]!.map((x) => x)),
      translators: json["translators"] == null
          ? []
          : List<dynamic>.from(json["translators"]!.map((x) => x)),
      subjects: json["subjects"] == null
          ? []
          : List<String>.from(json["subjects"]!.map((x) => x)),
      bookshelves: json["bookshelves"] == null
          ? []
          : List<String>.from(json["bookshelves"]!.map((x) => x)),
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      copyright: json["copyright"],
      mediaType: json["media_type"],
      formats: json["formats"] == null
          ? null
          : Formats.fromJson(json["formats"]),
      downloadCount: json["download_count"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": authors.map((x) => x.toJson()).toList(),
    "summaries": summaries.map((x) => x).toList(),
    "editors": editors.map((x) => x).toList(),
    "translators": translators.map((x) => x).toList(),
    "subjects": subjects.map((x) => x).toList(),
    "bookshelves": bookshelves.map((x) => x).toList(),
    "languages": languages.map((x) => x).toList(),
    "copyright": copyright,
    "media_type": mediaType,
    "formats": formats?.toJson(),
    "download_count": downloadCount,
  };
  LibraryBookModel toLibraryBook() => LibraryBookModel(
    bookId: "G_$id",
    bookTitle: title ?? "",
    bookPath: formats?.applicationEpubZip ?? "",
    bookCoverPath: formats?.imageJpeg ?? "",
    authors: authors.map((e) => e.name ?? "").toList(),
    langugeCode: languages[0],
    summaries: summaries[0],
    downloadCount: downloadCount,
  );
}

class Author {
  Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  final String? name;
  final int? birthYear;
  final int? deathYear;

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json["name"],
      birthYear: json["birth_year"],
      deathYear: json["death_year"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "birth_year": birthYear,
    "death_year": deathYear,
  };
}

class Formats {
  Formats({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.textPlainCharsetUsAscii,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.applicationOctetStream,
  });

  final String? textHtml;
  final String? applicationEpubZip;
  final String? applicationXMobipocketEbook;
  final String? textPlainCharsetUsAscii;
  final String? applicationRdfXml;
  final String? imageJpeg;
  final String? applicationOctetStream;

  factory Formats.fromJson(Map<String, dynamic> json) {
    return Formats(
      textHtml: json["text/html"],
      applicationEpubZip: json["application/epub+zip"],
      applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
      textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
      applicationRdfXml: json["application/rdf+xml"],
      imageJpeg: json["image/jpeg"],
      applicationOctetStream: json["application/octet-stream"],
    );
  }

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "application/octet-stream": applicationOctetStream,
  };
}
