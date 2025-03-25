// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moviedetail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetail {

 int get id; String get title; String? get posterPath; String get overview; String? get backdropPath; int get runtime; double get voteAverage; List<String> get genres;
/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailCopyWith<MovieDetail> get copyWith => _$MovieDetailCopyWithImpl<MovieDetail>(this as MovieDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other.genres, genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview,backdropPath,runtime,voteAverage,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, posterPath: $posterPath, overview: $overview, backdropPath: $backdropPath, runtime: $runtime, voteAverage: $voteAverage, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $MovieDetailCopyWith<$Res>  {
  factory $MovieDetailCopyWith(MovieDetail value, $Res Function(MovieDetail) _then) = _$MovieDetailCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? posterPath, String overview, String? backdropPath, int runtime, double voteAverage, List<String> genres
});




}
/// @nodoc
class _$MovieDetailCopyWithImpl<$Res>
    implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._self, this._then);

  final MovieDetail _self;
  final $Res Function(MovieDetail) _then;

/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? posterPath = freezed,Object? overview = null,Object? backdropPath = freezed,Object? runtime = null,Object? voteAverage = null,Object? genres = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _MovieDetail implements MovieDetail {
   _MovieDetail({required this.id, required this.title, this.posterPath, required this.overview, this.backdropPath, required this.runtime, required this.voteAverage, required final  List<String> genres}): _genres = genres;
  

@override final  int id;
@override final  String title;
@override final  String? posterPath;
@override final  String overview;
@override final  String? backdropPath;
@override final  int runtime;
@override final  double voteAverage;
 final  List<String> _genres;
@override List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailCopyWith<_MovieDetail> get copyWith => __$MovieDetailCopyWithImpl<_MovieDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&const DeepCollectionEquality().equals(other._genres, _genres));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,posterPath,overview,backdropPath,runtime,voteAverage,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'MovieDetail(id: $id, title: $title, posterPath: $posterPath, overview: $overview, backdropPath: $backdropPath, runtime: $runtime, voteAverage: $voteAverage, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailCopyWith<$Res> implements $MovieDetailCopyWith<$Res> {
  factory _$MovieDetailCopyWith(_MovieDetail value, $Res Function(_MovieDetail) _then) = __$MovieDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? posterPath, String overview, String? backdropPath, int runtime, double voteAverage, List<String> genres
});




}
/// @nodoc
class __$MovieDetailCopyWithImpl<$Res>
    implements _$MovieDetailCopyWith<$Res> {
  __$MovieDetailCopyWithImpl(this._self, this._then);

  final _MovieDetail _self;
  final $Res Function(_MovieDetail) _then;

/// Create a copy of MovieDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? posterPath = freezed,Object? overview = null,Object? backdropPath = freezed,Object? runtime = null,Object? voteAverage = null,Object? genres = null,}) {
  return _then(_MovieDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,runtime: null == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
