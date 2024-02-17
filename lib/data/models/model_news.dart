class ModelNews {
  bool? success;
  String? message;
  int? code;
  Data? data;

  ModelNews({this.success, this.message, this.code, this.data});

  ModelNews.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DataModel>? list;
  Links? links;
  Meta? meta;

  Data({this.list, this.links, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      list =[];
      json['data'].forEach((v) {
        list!.add(DataModel.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    if (list != null) {
      mapData['data'] = list!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      mapData['links'] = links!.toJson();
    }
    if (meta != null) {
      mapData['meta'] = meta!.toJson();
    }
    return mapData;
  }
}

class DataModel {
  int? id;
  String? slug;
  String? publishDate;
  String? title;
  String? type;
  String? src;
  String? videoImage;

  DataModel(
      {this.id,
        this.slug,
        this.publishDate,
        this.title,
        this.type,
        this.src,
        this.videoImage});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    publishDate = json['publish_date'];
    title = json['title'];
    type = json['type'];
    src = json['src'];
    videoImage = json['video_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['slug'] = slug;
    data['publish_date'] = publishDate;
    data['title'] = title;
    data['type'] = type;
    data['src'] = src;
    data['video_image'] = videoImage;
    return data;
  }
}

class Links {
  String? first;
  String? last;

  Links({this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<MetaLinks>? metaLinks;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.metaLinks,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      metaLinks = <MetaLinks>[];
      json['links'].forEach((v) {
        metaLinks!.add(MetaLinks.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (metaLinks != null) {
      data['links'] = metaLinks!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class MetaLinks {
  String? url;
  String? label;
  bool? active;

  MetaLinks({this.url, this.label, this.active});

  MetaLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
