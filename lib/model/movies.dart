
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
  List<Directors> _directors;
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
        List<Directors> directors,
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

  List<Directors> get directors => _directors;

  set directors(List<Directors> directors) => _directors = directors;

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
      _directors = new List<Directors>();
      json['directors'].forEach((v) {
        _directors.add(new Directors.fromJson(v));
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

class Rating {
  int _max;
  dynamic _average;
  String _stars;
  int _min;

  Rating({int max, dynamic average, String stars, int min}) {
    this._max = max;
    this._average = average;
    this._stars = stars;
    this._min = min;
  }

  int get max => _max;

  set max(int max) => _max = max;

  dynamic get average => _average;

  set average(dynamic average) => _average = average;

  String get stars => _stars;

  set stars(String stars) => _stars = stars;

  int get min => _min;

  set min(int min) => _min = min;

  Rating.fromJson(Map<String, dynamic> json) {
    _max = json['max'];
    _average = json['average'];
    _stars = json['stars'];
    _min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this._max;
    data['average'] = this._average;
    data['stars'] = this._stars;
    data['min'] = this._min;
    return data;
  }
}

class Casts {
  String _alt;
  Avatars _avatars;
  String _name;
  String _id;

  Casts({String alt, Avatars avatars, String name, String id}) {
    this._alt = alt;
    this._avatars = avatars;
    this._name = name;
    this._id = id;
  }

  String get alt => _alt;

  set alt(String alt) => _alt = alt;

  Avatars get avatars => _avatars;

  set avatars(Avatars avatars) => _avatars = avatars;

  String get name => _name;

  set name(String name) => _name = name;

  String get id => _id;

  set id(String id) => _id = id;

  Casts.fromJson(Map<String, dynamic> json) {
    _alt = json['alt'];
    _avatars =
    json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this._alt;
    if (this._avatars != null) {
      data['avatars'] = this._avatars.toJson();
    }
    data['name'] = this._name;
    data['id'] = this._id;
    return data;
  }
}

class Avatars {
  String _small;
  String _large;
  String _medium;

  Avatars({String small, String large, String medium}) {
    this._small = small;
    this._large = large;
    this._medium = medium;
  }

  String get small => _small;

  set small(String small) => _small = small;

  String get large => _large;

  set large(String large) => _large = large;

  String get medium => _medium;

  set medium(String medium) => _medium = medium;

  Avatars.fromJson(Map<String, dynamic> json) {
    _small = json['small'];
    _large = json['large'];
    _medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this._small;
    data['large'] = this._large;
    data['medium'] = this._medium;
    return data;
  }
}

class Directors {
  String _alt;
  Avatars _avatars;
  String _name;
  String _id;

  Directors({String alt, Avatars avatars, String name, String id}) {
    this._alt = alt;
    this._avatars = avatars;
    this._name = name;
    this._id = id;
  }

  String get alt => _alt;

  set alt(String alt) => _alt = alt;

  Avatars get avatars => _avatars;

  set avatars(Avatars avatars) => _avatars = avatars;

  String get name => _name;

  set name(String name) => _name = name;

  String get id => _id;

  set id(String id) => _id = id;

  Directors.fromJson(Map<String, dynamic> json) {
    _alt = json['alt'];
    _avatars =
    json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    _name = json['name'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this._alt;
    if (this._avatars != null) {
      data['avatars'] = this._avatars.toJson();
    }
    data['name'] = this._name;
    data['id'] = this._id;
    return data;
  }
}

class Images {
  String _small;
  String _large;
  String _medium;

  Images({String small, String large, String medium}) {
    this._small = small;
    this._large = large;
    this._medium = medium;
  }

  String get small => _small;

  set small(String small) => _small = small;

  String get large => _large;

  set large(String large) => _large = large;

  String get medium => _medium;

  set medium(String medium) => _medium = medium;

  Images.fromJson(Map<String, dynamic> json) {
    _small = json['small'];
    _large = json['large'];
    _medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this._small;
    data['large'] = this._large;
    data['medium'] = this._medium;
    return data;
  }
}