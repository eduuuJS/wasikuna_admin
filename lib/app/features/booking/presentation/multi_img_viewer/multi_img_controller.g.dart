// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_img_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setInitialIndexHash() => r'8a19c9cac6620c3cfb104eeaa52908ad14f21473';

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

/// See also [setInitialIndex].
@ProviderFor(setInitialIndex)
const setInitialIndexProvider = SetInitialIndexFamily();

/// See also [setInitialIndex].
class SetInitialIndexFamily extends Family<AsyncValue<void>> {
  /// See also [setInitialIndex].
  const SetInitialIndexFamily();

  /// See also [setInitialIndex].
  SetInitialIndexProvider call(
    int index,
  ) {
    return SetInitialIndexProvider(
      index,
    );
  }

  @override
  SetInitialIndexProvider getProviderOverride(
    covariant SetInitialIndexProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'setInitialIndexProvider';
}

/// See also [setInitialIndex].
class SetInitialIndexProvider extends AutoDisposeFutureProvider<void> {
  /// See also [setInitialIndex].
  SetInitialIndexProvider(
    int index,
  ) : this._internal(
          (ref) => setInitialIndex(
            ref as SetInitialIndexRef,
            index,
          ),
          from: setInitialIndexProvider,
          name: r'setInitialIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setInitialIndexHash,
          dependencies: SetInitialIndexFamily._dependencies,
          allTransitiveDependencies:
              SetInitialIndexFamily._allTransitiveDependencies,
          index: index,
        );

  SetInitialIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<void> Function(SetInitialIndexRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetInitialIndexProvider._internal(
        (ref) => create(ref as SetInitialIndexRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SetInitialIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetInitialIndexProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetInitialIndexRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `index` of this provider.
  int get index;
}

class _SetInitialIndexProviderElement
    extends AutoDisposeFutureProviderElement<void> with SetInitialIndexRef {
  _SetInitialIndexProviderElement(super.provider);

  @override
  int get index => (origin as SetInitialIndexProvider).index;
}

String _$imgSelectedIndexHash() => r'9582a7d9058775f70efbcc780e1b02ac99b355a5';

/// See also [ImgSelectedIndex].
@ProviderFor(ImgSelectedIndex)
final imgSelectedIndexProvider =
    AutoDisposeNotifierProvider<ImgSelectedIndex, int>.internal(
  ImgSelectedIndex.new,
  name: r'imgSelectedIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imgSelectedIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImgSelectedIndex = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
