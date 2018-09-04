import 'package:dou_ban_movie/model/movie/casts.dart';
import 'package:dou_ban_movie/model/movie/images.dart';
import 'package:dou_ban_movie/model/movie/rating.dart';

class Detail {
  Rating rating;
  int reviewsCount;
  int wishCount;
  String doubanSite;
  String year;
  Images images;
  String alt;
  String id;
  String mobileUrl;
  String title;
  Null doCount;
  String shareUrl;
  Null seasonsCount;
  String scheduleUrl;
  Null episodesCount;
  List<String> countries;
  List<String> genres;
  int collectCount;
  List<Casts> casts;
  Null currentSeason;
  String originalTitle;
  String summary;
  String subtype;
  List<Casts> directors;
  int commentsCount;
  int ratingsCount;
  List<String> aka;

  Detail({this.rating,
    this.reviewsCount,
    this.wishCount,
    this.doubanSite,
    this.year,
    this.images,
    this.alt,
    this.id,
    this.mobileUrl,
    this.title,
    this.doCount,
    this.shareUrl,
    this.seasonsCount,
    this.scheduleUrl,
    this.episodesCount,
    this.countries,
    this.genres,
    this.collectCount,
    this.casts,
    this.currentSeason,
    this.originalTitle,
    this.summary,
    this.subtype,
    this.directors,
    this.commentsCount,
    this.ratingsCount,
    this.aka});

  Detail.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    reviewsCount = json['reviews_count'];
    wishCount = json['wish_count'];
    doubanSite = json['douban_site'];
    year = json['year'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    alt = json['alt'];
    id = json['id'];
    mobileUrl = json['mobile_url'];
    title = json['title'];
    doCount = json['do_count'];
    shareUrl = json['share_url'];
    seasonsCount = json['seasons_count'];
    scheduleUrl = json['schedule_url'];
    episodesCount = json['episodes_count'];
    countries = json['countries'].cast<String>();
    genres = json['genres'].cast<String>();
    collectCount = json['collect_count'];
    if (json['casts'] != null) {
      casts = new List<Casts>();
      json['casts'].forEach((v) {
        casts.add(new Casts.fromJson(v));
      });
    }
    currentSeason = json['current_season'];
    originalTitle = json['original_title'];
    summary = json['summary'];
    subtype = json['subtype'];
    if (json['directors'] != null) {
      directors = new List<Casts>();
      json['directors'].forEach((v) {
        directors.add(new Casts.fromJson(v));
      });
    }
    commentsCount = json['comments_count'];
    ratingsCount = json['ratings_count'];
    aka = json['aka'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['reviews_count'] = this.reviewsCount;
    data['wish_count'] = this.wishCount;
    data['douban_site'] = this.doubanSite;
    data['year'] = this.year;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['mobile_url'] = this.mobileUrl;
    data['title'] = this.title;
    data['do_count'] = this.doCount;
    data['share_url'] = this.shareUrl;
    data['seasons_count'] = this.seasonsCount;
    data['schedule_url'] = this.scheduleUrl;
    data['episodes_count'] = this.episodesCount;
    data['countries'] = this.countries;
    data['genres'] = this.genres;
    data['collect_count'] = this.collectCount;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['current_season'] = this.currentSeason;
    data['original_title'] = this.originalTitle;
    data['summary'] = this.summary;
    data['subtype'] = this.subtype;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['comments_count'] = this.commentsCount;
    data['ratings_count'] = this.ratingsCount;
    data['aka'] = this.aka;
    return data;
  }
}
