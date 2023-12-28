// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newBookingLoaderHash() => r'85ee2a2acd7485872138db3b4d70658a7ef3d446';

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

/// See also [newBookingLoader].
@ProviderFor(newBookingLoader)
const newBookingLoaderProvider = NewBookingLoaderFamily();

/// See also [newBookingLoader].
class NewBookingLoaderFamily extends Family<AsyncValue<bool>> {
  /// See also [newBookingLoader].
  const NewBookingLoaderFamily();

  /// See also [newBookingLoader].
  NewBookingLoaderProvider call(
    String idArea,
    DateTime dateBooking,
  ) {
    return NewBookingLoaderProvider(
      idArea,
      dateBooking,
    );
  }

  @override
  NewBookingLoaderProvider getProviderOverride(
    covariant NewBookingLoaderProvider provider,
  ) {
    return call(
      provider.idArea,
      provider.dateBooking,
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
  String? get name => r'newBookingLoaderProvider';
}

/// See also [newBookingLoader].
class NewBookingLoaderProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [newBookingLoader].
  NewBookingLoaderProvider(
    String idArea,
    DateTime dateBooking,
  ) : this._internal(
          (ref) => newBookingLoader(
            ref as NewBookingLoaderRef,
            idArea,
            dateBooking,
          ),
          from: newBookingLoaderProvider,
          name: r'newBookingLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newBookingLoaderHash,
          dependencies: NewBookingLoaderFamily._dependencies,
          allTransitiveDependencies:
              NewBookingLoaderFamily._allTransitiveDependencies,
          idArea: idArea,
          dateBooking: dateBooking,
        );

  NewBookingLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idArea,
    required this.dateBooking,
  }) : super.internal();

  final String idArea;
  final DateTime dateBooking;

  @override
  Override overrideWith(
    FutureOr<bool> Function(NewBookingLoaderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewBookingLoaderProvider._internal(
        (ref) => create(ref as NewBookingLoaderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idArea: idArea,
        dateBooking: dateBooking,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _NewBookingLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewBookingLoaderProvider &&
        other.idArea == idArea &&
        other.dateBooking == dateBooking;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idArea.hashCode);
    hash = _SystemHash.combine(hash, dateBooking.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewBookingLoaderRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `idArea` of this provider.
  String get idArea;

  /// The parameter `dateBooking` of this provider.
  DateTime get dateBooking;
}

class _NewBookingLoaderProviderElement
    extends AutoDisposeFutureProviderElement<bool> with NewBookingLoaderRef {
  _NewBookingLoaderProviderElement(super.provider);

  @override
  String get idArea => (origin as NewBookingLoaderProvider).idArea;
  @override
  DateTime get dateBooking => (origin as NewBookingLoaderProvider).dateBooking;
}

String _$areaDetailBookingHash() => r'ab0670ecf3604fd645564053f28c3bc4931520cf';

/// See also [AreaDetailBooking].
@ProviderFor(AreaDetailBooking)
final areaDetailBookingProvider =
    AutoDisposeNotifierProvider<AreaDetailBooking, AreaDetailDomain?>.internal(
  AreaDetailBooking.new,
  name: r'areaDetailBookingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$areaDetailBookingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AreaDetailBooking = AutoDisposeNotifier<AreaDetailDomain?>;
String _$imageListStateHash() => r'787f69ed22f863da94d20ba59e8a7486691bf032';

/// See also [ImageListState].
@ProviderFor(ImageListState)
final imageListStateProvider =
    AutoDisposeNotifierProvider<ImageListState, List<File>>.internal(
  ImageListState.new,
  name: r'imageListStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageListStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImageListState = AutoDisposeNotifier<List<File>>;
String _$newBookingControllerHash() =>
    r'fe8d405d7ddc20999f3877ef8f7d2f5ea13266f9';

/// See also [NewBookingController].
@ProviderFor(NewBookingController)
final newBookingControllerProvider =
    AutoDisposeNotifierProvider<NewBookingController, void>.internal(
  NewBookingController.new,
  name: r'newBookingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newBookingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewBookingController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
