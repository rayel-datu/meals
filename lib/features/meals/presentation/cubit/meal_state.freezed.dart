// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MealState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealStateCopyWith<$Res> {
  factory $MealStateCopyWith(MealState value, $Res Function(MealState) then) =
      _$MealStateCopyWithImpl<$Res, MealState>;
}

/// @nodoc
class _$MealStateCopyWithImpl<$Res, $Val extends MealState>
    implements $MealStateCopyWith<$Res> {
  _$MealStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MealInitialStateImplCopyWith<$Res> {
  factory _$$MealInitialStateImplCopyWith(
    _$MealInitialStateImpl value,
    $Res Function(_$MealInitialStateImpl) then,
  ) = __$$MealInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealInitialStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealInitialStateImpl>
    implements _$$MealInitialStateImplCopyWith<$Res> {
  __$$MealInitialStateImplCopyWithImpl(
    _$MealInitialStateImpl _value,
    $Res Function(_$MealInitialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MealInitialStateImpl implements MealInitialState {
  _$MealInitialStateImpl();

  @override
  String toString() {
    return 'MealState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MealInitialState implements MealState {
  factory MealInitialState() = _$MealInitialStateImpl;
}

/// @nodoc
abstract class _$$MealLoadingStateImplCopyWith<$Res> {
  factory _$$MealLoadingStateImplCopyWith(
    _$MealLoadingStateImpl value,
    $Res Function(_$MealLoadingStateImpl) then,
  ) = __$$MealLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealLoadingStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealLoadingStateImpl>
    implements _$$MealLoadingStateImplCopyWith<$Res> {
  __$$MealLoadingStateImplCopyWithImpl(
    _$MealLoadingStateImpl _value,
    $Res Function(_$MealLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MealLoadingStateImpl implements MealLoadingState {
  _$MealLoadingStateImpl();

  @override
  String toString() {
    return 'MealState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MealLoadingState implements MealState {
  factory MealLoadingState() = _$MealLoadingStateImpl;
}

/// @nodoc
abstract class _$$MealLoadedStateImplCopyWith<$Res> {
  factory _$$MealLoadedStateImplCopyWith(
    _$MealLoadedStateImpl value,
    $Res Function(_$MealLoadedStateImpl) then,
  ) = __$$MealLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MealItemModel> meals});
}

/// @nodoc
class __$$MealLoadedStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealLoadedStateImpl>
    implements _$$MealLoadedStateImplCopyWith<$Res> {
  __$$MealLoadedStateImplCopyWithImpl(
    _$MealLoadedStateImpl _value,
    $Res Function(_$MealLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = null}) {
    return _then(
      _$MealLoadedStateImpl(
        null == meals
            ? _value._meals
            : meals // ignore: cast_nullable_to_non_nullable
                as List<MealItemModel>,
      ),
    );
  }
}

/// @nodoc

class _$MealLoadedStateImpl implements MealLoadedState {
  _$MealLoadedStateImpl(final List<MealItemModel> meals) : _meals = meals;

  final List<MealItemModel> _meals;
  @override
  List<MealItemModel> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  @override
  String toString() {
    return 'MealState.loaded(meals: $meals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealLoadedStateImplCopyWith<_$MealLoadedStateImpl> get copyWith =>
      __$$MealLoadedStateImplCopyWithImpl<_$MealLoadedStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) {
    return loaded(meals);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) {
    return loaded?.call(meals);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(meals);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MealLoadedState implements MealState {
  factory MealLoadedState(final List<MealItemModel> meals) =
      _$MealLoadedStateImpl;

  List<MealItemModel> get meals;

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealLoadedStateImplCopyWith<_$MealLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MealEmptyResultsStateImplCopyWith<$Res> {
  factory _$$MealEmptyResultsStateImplCopyWith(
    _$MealEmptyResultsStateImpl value,
    $Res Function(_$MealEmptyResultsStateImpl) then,
  ) = __$$MealEmptyResultsStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealEmptyResultsStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealEmptyResultsStateImpl>
    implements _$$MealEmptyResultsStateImplCopyWith<$Res> {
  __$$MealEmptyResultsStateImplCopyWithImpl(
    _$MealEmptyResultsStateImpl _value,
    $Res Function(_$MealEmptyResultsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MealEmptyResultsStateImpl implements MealEmptyResultsState {
  _$MealEmptyResultsStateImpl();

  @override
  String toString() {
    return 'MealState.emptyResults()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealEmptyResultsStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) {
    return emptyResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) {
    return emptyResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (emptyResults != null) {
      return emptyResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) {
    return emptyResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) {
    return emptyResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) {
    if (emptyResults != null) {
      return emptyResults(this);
    }
    return orElse();
  }
}

abstract class MealEmptyResultsState implements MealState {
  factory MealEmptyResultsState() = _$MealEmptyResultsStateImpl;
}

/// @nodoc
abstract class _$$MealErrorStateImplCopyWith<$Res> {
  factory _$$MealErrorStateImplCopyWith(
    _$MealErrorStateImpl value,
    $Res Function(_$MealErrorStateImpl) then,
  ) = __$$MealErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealErrorStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealErrorStateImpl>
    implements _$$MealErrorStateImplCopyWith<$Res> {
  __$$MealErrorStateImplCopyWithImpl(
    _$MealErrorStateImpl _value,
    $Res Function(_$MealErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MealErrorStateImpl implements MealErrorState {
  _$MealErrorStateImpl();

  @override
  String toString() {
    return 'MealState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MealItemModel> meals) loaded,
    required TResult Function() emptyResults,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<MealItemModel> meals)? loaded,
    TResult? Function()? emptyResults,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MealItemModel> meals)? loaded,
    TResult Function()? emptyResults,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealInitialState value) initial,
    required TResult Function(MealLoadingState value) loading,
    required TResult Function(MealLoadedState value) loaded,
    required TResult Function(MealEmptyResultsState value) emptyResults,
    required TResult Function(MealErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealInitialState value)? initial,
    TResult? Function(MealLoadingState value)? loading,
    TResult? Function(MealLoadedState value)? loaded,
    TResult? Function(MealEmptyResultsState value)? emptyResults,
    TResult? Function(MealErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealInitialState value)? initial,
    TResult Function(MealLoadingState value)? loading,
    TResult Function(MealLoadedState value)? loaded,
    TResult Function(MealEmptyResultsState value)? emptyResults,
    TResult Function(MealErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MealErrorState implements MealState {
  factory MealErrorState() = _$MealErrorStateImpl;
}
