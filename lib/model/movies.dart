import 'package:dou_ban_movie/model/casts.dart';
import 'package:dou_ban_movie/model/images.dart';
import 'package:dou_ban_movie/model/rating.dart';

class Movies {
  int _count;
  int _start;
  int _total;
  List<Subjects> _subjects;
  String _title;

  Movies(
      {int count,
      int start,
      int total,
      List<Subjects> subjects,
      String title}) {
    this._count = count;
    this._start = start;
    this._total = total;
    this._subjects = subjects;
    this._title = title;
  }

  int get count => _count;

  set count(int count) => _count = count;

  int get start => _start;

  set start(int start) => _start = start;

  int get total => _total;

  set total(int total) => _total = total;

  List<Subjects> get subjects => _subjects;

  set subjects(List<Subjects> subjects) => _subjects = subjects;

  String get title => _title;

  set title(String title) => _title = title;

  Movies.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    _start = json['start'];
    _total = json['total'];
    if (json['subjects'] != null) {
      _subjects = new List<Subjects>();
      json['subjects'].forEach((v) {
        _subjects.add(new Subjects.fromJson(v));
      });
    }
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    data['start'] = this._start;
    data['total'] = this._total;
    if (this._subjects != null) {
      data['subjects'] = this._subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this._title;
    return data;
  }
}

class Subjects {
  Rating _rating;
  List<dynamic> _genres;
  String _title;
  List<Casts> _casts;
  int _collectCount;
  String _originalTitle;
  String _subtype;
  List<Casts> _directors;
  String _year;
  Images _images;
  String _alt;
  String _id;

  Subjects(
      {Rating rating,
      List<String> genres,
      String title,
      List<Casts> casts,
      int collectCount,
      String originalTitle,
      String subtype,
      List<Casts> directors,
      String year,
      Images images,
      String alt,
      String id}) {
    this._rating = rating;
    this._genres = genres;
    this._title = title;
    this._casts = casts;
    this._collectCount = collectCount;
    this._originalTitle = originalTitle;
    this._subtype = subtype;
    this._directors = directors;
    this._year = year;
    this._images = images;
    this._alt = alt;
    this._id = id;
  }

  Rating get rating => _rating;

  set rating(Rating rating) => _rating = rating;

  List<String> get genres => _genres;

  set genres(List<String> genres) => _genres = genres;

  String get title => _title;

  set title(String title) => _title = title;

  List<Casts> get casts => _casts;

  set casts(List<Casts> casts) => _casts = casts;

  int get collectCount => _collectCount;

  set collectCount(int collectCount) => _collectCount = collectCount;

  String get originalTitle => _originalTitle;

  set originalTitle(String originalTitle) => _originalTitle = originalTitle;

  String get subtype => _subtype;

  set subtype(String subtype) => _subtype = subtype;

  List<Casts> get directors => _directors;

  set directors(List<Casts> directors) => _directors = directors;

  String get year => _year;

  set year(String year) => _year = year;

  Images get images => _images;

  set images(Images images) => _images = images;

  String get alt => _alt;

  set alt(String alt) => _alt = alt;

  String get id => _id;

  set id(String id) => _id = id;

  Subjects.fromJson(Map<String, dynamic> json) {
    _rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    _genres = json['genres'];
    _title = json['title'];
    if (json['casts'] != null) {
      _casts = new List<Casts>();
      json['casts'].forEach((v) {
        _casts.add(new Casts.fromJson(v));
      });
    }
    _collectCount = json['collect_count'];
    _originalTitle = json['original_title'];
    _subtype = json['subtype'];
    if (json['directors'] != null) {
      _directors = new List<Casts>();
      json['directors'].forEach((v) {
        _directors.add(new Casts.fromJson(v));
      });
    }
    _year = json['year'];
    _images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    _alt = json['alt'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._rating != null) {
      data['rating'] = this._rating.toJson();
    }
    data['genres'] = this._genres;
    data['title'] = this._title;
    if (this._casts != null) {
      data['casts'] = this._casts.map((v) => v.toJson()).toList();
    }
    data['collect_count'] = this._collectCount;
    data['original_title'] = this._originalTitle;
    data['subtype'] = this._subtype;
    if (this._directors != null) {
      data['directors'] = this._directors.map((v) => v.toJson()).toList();
    }
    data['year'] = this._year;
    if (this._images != null) {
      data['images'] = this._images.toJson();
    }
    data['alt'] = this._alt;
    data['id'] = this._id;
    return data;
  }
}
