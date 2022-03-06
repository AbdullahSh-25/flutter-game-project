class GamePageDetail {
  int? count;
  String? next;
  String? previous;
  List<Results>? results = [];

  GamePageDetail({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  GamePageDetail.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    } else {
      results = <Results>[];
    }
  }
}

class Results {
  int? id;
  String? name;
  String? released;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Platforms>? platforms;
  List<Genres>? genres;
  List<Stores>? stores;

  Results({
    this.id,
    this.name,
    this.released,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.platforms,
    this.genres,
    this.stores,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['name'] == null) {
      name = 'UnKnown...';
    } else {
      name = json['name'];
    }
    if (json['released'] == null) {
      released = 'UnKnown...';
    } else {
      released = json['released'];
    }
    if (json['background_image'] == null) {
      backgroundImage =
          'https://4.bp.blogspot.com/-OCutvC4wPps/XfNnRz5PvhI/AAAAAAAAEfo/qJ8P1sqLWesMdOSiEoUH85s3hs_vn97HACLcBGAsYHQ/s1600/no-image-found-360x260.png';
    } else {
      backgroundImage = json['background_image'];
    }
    if (json['rating'] == null) {
      rating = 0;
    } else {
      rating = json['rating'];
    }
    if (json['rating_top'] == null) {
      ratingTop = 0;
    } else {
      ratingTop = json['rating_top'];
    }
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(Platforms.fromJson(v));
      });
    } else {
      platforms = [];
    }

    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    } else {
      genres = [];
    }
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(Stores.fromJson(v));
      });
    } else {
      stores = [];
    }
  }
}

class Platforms {
  Platform? platform;
  String? releasedAt;
  RequirementsEn? requirementsEn;

  Platforms({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
  });

  Platforms.fromJson(Map<String, dynamic> json) {
    platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    releasedAt = json['released_at'];
    requirementsEn = json['requirements_en'] != null
        ? RequirementsEn.fromJson(json['requirements_en'])
        : null;
  }
}

class Platform {
  String? name;

  Platform({
    this.name,
  });

  Platform.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class RequirementsEn {
  String? minimum;
  String? recommended;

  RequirementsEn({this.minimum, this.recommended});

  RequirementsEn.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    recommended = json['recommended'];
  }
}

class Genres {
  String? name;

  Genres({
    this.name,
  });

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  @override
  String toString() {
    return '$name';
  }
}

class Stores {
  Store? store;

  Stores({this.store});

  @override
  String toString() {
    return store.toString();
  }

  Stores.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }
}

class Store {
  String? name;

  Store({
    this.name,
  });

  @override
  String toString() {
    return '$name';
  }

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
