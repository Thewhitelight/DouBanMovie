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
