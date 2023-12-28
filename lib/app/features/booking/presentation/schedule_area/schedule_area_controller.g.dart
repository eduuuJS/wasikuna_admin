// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_area_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$scheduleAreasLoaderHash() =>
    r'51a9c4276ab3d5be7885f070e75c862f7a00633c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [scheduleAreasLoader].
@ProviderFor(scheduleAreasLoader)
const scheduleAreasLoaderProvider = ScheduleAreasLoaderFamily();

/// See also [scheduleAreasLoader].
class ScheduleAreasLoaderFamily extends Family<AsyncValue<bool>> {
  /// See also [scheduleAreasLoader].
  const ScheduleAreasLoaderFamily();

  /// See also [scheduleAreasLoader].
  ScheduleAreasLoaderProvider call(
    String id,
    DateTime date,
  ) {
    return ScheduleAreasLoaderProvider(
      id,
      date,
    );
  }

  @override
  ScheduleAreasLoaderProvider getProviderOverride(
    covariant ScheduleAreasLoaderProvider provider,
  ) {
    return call(
      provider.id,
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'scheduleAreasLoaderProvider';
}

/// See also [scheduleAreasLoader].
class ScheduleAreasLoaderProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [scheduleAreasLoader].
  ScheduleAreasLoaderProvider(
    String id,
    DateTime date,
  ) : this._internal(
          (ref) => scheduleAreasLoader(
            ref as ScheduleAreasLoaderRef,
            id,
            date,
          ),
          from: scheduleAreasLoaderProvider,
          name: r'scheduleAreasLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$scheduleAreasLoaderHash,
          dependencies: ScheduleAreasLoaderFamily._dependencies,
          allTransitiveDependencies:
              ScheduleAreasLoaderFamily._allTransitiveDependencies,
          id: id,
          date: date,
        );

  ScheduleAreasLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.date,
  }) : super.internal();

  final String id;
  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ScheduleAreasLoaderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ScheduleAreasLoaderProvider._internal(
        (ref) => create(ref as ScheduleAreasLoaderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ScheduleAreasLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleAreasLoaderProvider &&
        other.id == id &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ScheduleAreasLoaderRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _ScheduleAreasLoaderProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ScheduleAreasLoaderRef {
  _ScheduleAreasLoaderProviderElement(super.provider);

  @override
  String get id => (origin as ScheduleAreasLoaderProvider).id;
  @override
  DateTime get date => (origin as ScheduleAreasLoaderProvider).date;
}

String _$scheduleAreasListHash() => r'ef37b0fa3a7c16458eb7239fae9944142b1bac36';

/// See also [ScheduleAreasList].
@ProviderFor(ScheduleAreasList)
final scheduleAreasListProvider = AutoDisposeNotifierProvider<ScheduleAreasList,
    List<ScheduleAreaItemDomain>>.internal(
  ScheduleAreasList.new,
  name: r'scheduleAreasListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleAreasListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleAreasList = AutoDisposeNotifier<List<ScheduleAreaItemDomain>>;
String _$dateSelectorListHash() => r'e17adb88ddf6093167f41e9fe5e4db69e36529e4';

/// See also [DateSelectorList].
@ProviderFor(DateSelectorList)
final dateSelectorListProvider = AutoDisposeNotifierProvider<DateSelectorList,
    List<DateSelectorItemDomain>>.internal(
  DateSelectorList.new,
  name: r'dateSelectorListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dateSelectorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DateSelectorList = AutoDisposeNotifier<List<DateSelectorItemDomain>>;
String _$scheduleAreaRefreshHash() =>
    r'55c55f7a64eba567ada67af4ce3c87bac6327ff3';

/// See also [ScheduleAreaRefresh].
@ProviderFor(ScheduleAreaRefresh)
final scheduleAreaRefreshProvider =
    AutoDisposeNotifierProvider<ScheduleAreaRefresh, bool>.internal(
  ScheduleAreaRefresh.new,
  name: r'scheduleAreaRefreshProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleAreaRefreshHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ScheduleAreaRefresh = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
