class DetailModel {
  bool? success;
  String? message;
  int? code;
  Data? data;

  DetailModel({this.success, this.message, this.code, this.data});

  DetailModel.fromJson(Map<String, dynamic> json) {
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
  DataInner? dataInner;

  Data({this.dataInner});

  Data.fromJson(Map<String, dynamic> json) {
    dataInner = json['data'] != null ? DataInner.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (dataInner != null) {
      data['data'] = dataInner!.toJson();
    }
    return data;
  }
}

class DataInner {
  int? id;
  String? name;
  String? guarantee;
  Catalog? catalog;
  List<String>? smallImages;
  List<String>? largeImages;
  String? availability;
  String? model;
  String? brand;
  int? salePrice;
  int? loanPrice;
  String? monthlyPrice;
  String? code;
  List<SaleMonths>? saleMonths;
  int? reviewsCount;
  int? reviewsMiddleRating;
  Seo? seo;
  List<Stickers>? stickers;
  List<MainCharacters>? mainCharacters;
  List<Breadcrumbs>? breadcrumbs;
  String? overview;
  List<Characters>? characters;
  List<AvailableStores>? availableStores;

  DataInner(
      {this.id,
        this.name,
        this.guarantee,
        this.catalog,
        this.smallImages,
        this.largeImages,
        this.availability,
        this.model,
        this.brand,
        this.salePrice,
        this.loanPrice,
        this.monthlyPrice,
        this.code,
        this.saleMonths,
        this.reviewsCount,
        this.reviewsMiddleRating,
        this.seo,
        this.stickers,
        this.mainCharacters,
        this.breadcrumbs,
        this.overview,
        this.characters,
        this.availableStores,
       });

  DataInner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guarantee = json['guarantee'];
    catalog =
    json['catalog'] != null ?Catalog.fromJson(json['catalog']) : null;
    smallImages = json['small_images'].cast<String>();
    largeImages = json['large_images'].cast<String>();
    availability = json['availability'];
    model = json['model'];
    brand = json['brand'];
    salePrice = json['sale_price'];
    loanPrice = json['loan_price'];

    monthlyPrice = json['monthly_price'];
    code = json['code'];
    if (json['sale_months'] != null) {
      saleMonths = <SaleMonths>[];
      json['sale_months'].forEach((v) {
        saleMonths!.add(SaleMonths.fromJson(v));
      });
    }
    reviewsCount = json['reviews_count'];
    reviewsMiddleRating = json['reviews_middle_rating'];
    seo = json['seo'] != null ?  Seo.fromJson(json['seo']) : null;
    if (json['stickers'] != null) {
      stickers = <Stickers>[];
      json['stickers'].forEach((v) {
        stickers!.add( Stickers.fromJson(v));
      });
    }
    if (json['main_characters'] != null) {
      mainCharacters = <MainCharacters>[];
      json['main_characters'].forEach((v) {
        mainCharacters!.add(MainCharacters.fromJson(v));
      });
    }

    if (json['breadcrumbs'] != null) {
      breadcrumbs = <Breadcrumbs>[];
      json['breadcrumbs'].forEach((v) {
        breadcrumbs!.add(new Breadcrumbs.fromJson(v));
      });
    }
    overview = json['overview'];
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(new Characters.fromJson(v));
      });
    }
    if (json['available_stores'] != null) {
      availableStores = <AvailableStores>[];
      json['available_stores'].forEach((v) {
        availableStores!.add(new AvailableStores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['guarantee'] = guarantee;
    if (catalog != null) {
      data['catalog'] = catalog!.toJson();
    }
    data['small_images'] = smallImages;
    data['large_images'] = largeImages;
    data['availability'] = availability;
    data['model'] = model;
    data['brand'] = brand;
    data['sale_price'] = salePrice;
    data['loan_price'] = loanPrice;
    data['monthly_price'] = monthlyPrice;
    data['code'] = code;
    if (saleMonths != null) {
      data['sale_months'] = saleMonths!.map((v) => v.toJson()).toList();
    }
    data['reviews_count'] = reviewsCount;
    data['reviews_middle_rating'] = reviewsMiddleRating;
    if (seo != null) {
      data['seo'] = seo!.toJson();
    }
    if (stickers != null) {
      data['stickers'] = stickers!.map((v) => v.toJson()).toList();
    }
    if (mainCharacters != null) {
      data['main_characters'] =
          mainCharacters!.map((v) => v.toJson()).toList();
    }

    if (breadcrumbs != null) {
      data['breadcrumbs'] = breadcrumbs!.map((v) => v.toJson()).toList();
    }

    data['overview'] = overview;
    if (characters != null) {
      data['characters'] = characters!.map((v) => v.toJson()).toList();
    }
    if (availableStores != null) {
      data['available_stores'] =
          availableStores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catalog {
  String? name;
  int? minPrice;
  int? maxPrice;

  Catalog({this.name, this.minPrice, this.maxPrice});

  Catalog.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    return data;
  }
}

class SaleMonths {
  int? id;
  String? key;
  String? name;
  String? image;

  SaleMonths({this.id, this.key, this.name, this.image});

  SaleMonths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Seo {
  String? title;
  String? description;
  String? keywords;
  String? image;
  String? scriptSeo;

  Seo(
      {this.title,
        this.description,
        this.keywords,
        this.image,
        this.scriptSeo});

  Seo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    image = json['image'];
    scriptSeo = json['script_seo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['keywords'] = keywords;
    data['image'] = image;
    data['script_seo'] = scriptSeo;
    return data;
  }
}

class Stickers {
  String? name;
  String? backgroundColor;
  String? textColor;
  bool? isImage;
  bool? showInCard;


  Stickers(
      {this.name,
        this.backgroundColor,
        this.textColor,
        this.isImage,
        this.showInCard,
        });

  Stickers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    backgroundColor = json['background_color'];
    textColor = json['text_color'];
    isImage = json['is_image'];
    showInCard = json['show_in_card'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['background_color'] = backgroundColor;
    data['text_color'] = textColor;
    data['is_image'] = isImage;
    data['show_in_card'] = showInCard;
    return data;
  }
}

class MainCharacters {
  String? name;
  String? value;

  MainCharacters({this.name, this.value});

  MainCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}

class Breadcrumbs {
  String? name;
  String? slug;
  int? id;
  String? type;

  Breadcrumbs({this.name, this.slug, this.id, this.type});

  Breadcrumbs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['slug'] = slug;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Characters {
  String? name;
  List<Characters>? characters;

  Characters({this.name, this.characters});

  Characters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(Characters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (characters != null) {
      data['characters'] = characters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableStores {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? phone;
  String? address;
  String? description;
  String? workTime;

  AvailableStores(
      {this.id,
        this.name,
        this.lat,
        this.long,
        this.phone,
        this.address,
        this.description,
        this.workTime});

  AvailableStores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    workTime = json['work_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['lat'] = lat;
    data['long'] = long;
    data['phone'] = phone;
    data['address'] = address;
    data['description'] = description;
    data['work_time'] = workTime;
    return data;
  }
}
