// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Game extends DataClass implements Insertable<Game> {
  final int id;
  final String name;
  final String released;
  final String backgroundImage;
  final String stores;
  final String genres;
  final String rating;
  final String ratingTop;
  Game(
      {required this.id,
      required this.name,
      required this.released,
      required this.backgroundImage,
      required this.stores,
      required this.genres,
      required this.rating,
      required this.ratingTop});
  factory Game.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Game(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      released: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}released'])!,
      backgroundImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}background_image'])!,
      stores: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stores'])!,
      genres: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genres'])!,
      rating: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      ratingTop: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating_top'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['released'] = Variable<String>(released);
    map['background_image'] = Variable<String>(backgroundImage);
    map['stores'] = Variable<String>(stores);
    map['genres'] = Variable<String>(genres);
    map['rating'] = Variable<String>(rating);
    map['rating_top'] = Variable<String>(ratingTop);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      name: Value(name),
      released: Value(released),
      backgroundImage: Value(backgroundImage),
      stores: Value(stores),
      genres: Value(genres),
      rating: Value(rating),
      ratingTop: Value(ratingTop),
    );
  }

  factory Game.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      released: serializer.fromJson<String>(json['released']),
      backgroundImage: serializer.fromJson<String>(json['backgroundImage']),
      stores: serializer.fromJson<String>(json['stores']),
      genres: serializer.fromJson<String>(json['genres']),
      rating: serializer.fromJson<String>(json['rating']),
      ratingTop: serializer.fromJson<String>(json['ratingTop']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'released': serializer.toJson<String>(released),
      'backgroundImage': serializer.toJson<String>(backgroundImage),
      'stores': serializer.toJson<String>(stores),
      'genres': serializer.toJson<String>(genres),
      'rating': serializer.toJson<String>(rating),
      'ratingTop': serializer.toJson<String>(ratingTop),
    };
  }

  Game copyWith(
          {int? id,
          String? name,
          String? released,
          String? backgroundImage,
          String? stores,
          String? genres,
          String? rating,
          String? ratingTop}) =>
      Game(
        id: id ?? this.id,
        name: name ?? this.name,
        released: released ?? this.released,
        backgroundImage: backgroundImage ?? this.backgroundImage,
        stores: stores ?? this.stores,
        genres: genres ?? this.genres,
        rating: rating ?? this.rating,
        ratingTop: ratingTop ?? this.ratingTop,
      );
  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('released: $released, ')
          ..write('backgroundImage: $backgroundImage, ')
          ..write('stores: $stores, ')
          ..write('genres: $genres, ')
          ..write('rating: $rating, ')
          ..write('ratingTop: $ratingTop')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, released, backgroundImage, stores, genres, rating, ratingTop);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.name == this.name &&
          other.released == this.released &&
          other.backgroundImage == this.backgroundImage &&
          other.stores == this.stores &&
          other.genres == this.genres &&
          other.rating == this.rating &&
          other.ratingTop == this.ratingTop);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> released;
  final Value<String> backgroundImage;
  final Value<String> stores;
  final Value<String> genres;
  final Value<String> rating;
  final Value<String> ratingTop;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.released = const Value.absent(),
    this.backgroundImage = const Value.absent(),
    this.stores = const Value.absent(),
    this.genres = const Value.absent(),
    this.rating = const Value.absent(),
    this.ratingTop = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String released,
    required String backgroundImage,
    required String stores,
    required String genres,
    required String rating,
    required String ratingTop,
  })  : name = Value(name),
        released = Value(released),
        backgroundImage = Value(backgroundImage),
        stores = Value(stores),
        genres = Value(genres),
        rating = Value(rating),
        ratingTop = Value(ratingTop);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? released,
    Expression<String>? backgroundImage,
    Expression<String>? stores,
    Expression<String>? genres,
    Expression<String>? rating,
    Expression<String>? ratingTop,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (released != null) 'released': released,
      if (backgroundImage != null) 'background_image': backgroundImage,
      if (stores != null) 'stores': stores,
      if (genres != null) 'genres': genres,
      if (rating != null) 'rating': rating,
      if (ratingTop != null) 'rating_top': ratingTop,
    });
  }

  GamesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? released,
      Value<String>? backgroundImage,
      Value<String>? stores,
      Value<String>? genres,
      Value<String>? rating,
      Value<String>? ratingTop}) {
    return GamesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      released: released ?? this.released,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      stores: stores ?? this.stores,
      genres: genres ?? this.genres,
      rating: rating ?? this.rating,
      ratingTop: ratingTop ?? this.ratingTop,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (released.present) {
      map['released'] = Variable<String>(released.value);
    }
    if (backgroundImage.present) {
      map['background_image'] = Variable<String>(backgroundImage.value);
    }
    if (stores.present) {
      map['stores'] = Variable<String>(stores.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    if (rating.present) {
      map['rating'] = Variable<String>(rating.value);
    }
    if (ratingTop.present) {
      map['rating_top'] = Variable<String>(ratingTop.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('released: $released, ')
          ..write('backgroundImage: $backgroundImage, ')
          ..write('stores: $stores, ')
          ..write('genres: $genres, ')
          ..write('rating: $rating, ')
          ..write('ratingTop: $ratingTop')
          ..write(')'))
        .toString();
  }
}

class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _releasedMeta = const VerificationMeta('released');
  @override
  late final GeneratedColumn<String?> released = GeneratedColumn<String?>(
      'released', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _backgroundImageMeta =
      const VerificationMeta('backgroundImage');
  @override
  late final GeneratedColumn<String?> backgroundImage =
      GeneratedColumn<String?>('background_image', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _storesMeta = const VerificationMeta('stores');
  @override
  late final GeneratedColumn<String?> stores = GeneratedColumn<String?>(
      'stores', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String?> genres = GeneratedColumn<String?>(
      'genres', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<String?> rating = GeneratedColumn<String?>(
      'rating', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ratingTopMeta = const VerificationMeta('ratingTop');
  @override
  late final GeneratedColumn<String?> ratingTop = GeneratedColumn<String?>(
      'rating_top', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, released, backgroundImage, stores, genres, rating, ratingTop];
  @override
  String get aliasedName => _alias ?? 'games';
  @override
  String get actualTableName => 'games';
  @override
  VerificationContext validateIntegrity(Insertable<Game> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('released')) {
      context.handle(_releasedMeta,
          released.isAcceptableOrUnknown(data['released']!, _releasedMeta));
    } else if (isInserting) {
      context.missing(_releasedMeta);
    }
    if (data.containsKey('background_image')) {
      context.handle(
          _backgroundImageMeta,
          backgroundImage.isAcceptableOrUnknown(
              data['background_image']!, _backgroundImageMeta));
    } else if (isInserting) {
      context.missing(_backgroundImageMeta);
    }
    if (data.containsKey('stores')) {
      context.handle(_storesMeta,
          stores.isAcceptableOrUnknown(data['stores']!, _storesMeta));
    } else if (isInserting) {
      context.missing(_storesMeta);
    }
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres']!, _genresMeta));
    } else if (isInserting) {
      context.missing(_genresMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('rating_top')) {
      context.handle(_ratingTopMeta,
          ratingTop.isAcceptableOrUnknown(data['rating_top']!, _ratingTopMeta));
    } else if (isInserting) {
      context.missing(_ratingTopMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Game.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GamesTable games = $GamesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [games];
}
