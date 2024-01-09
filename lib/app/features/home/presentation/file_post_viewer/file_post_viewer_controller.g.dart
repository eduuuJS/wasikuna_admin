// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_post_viewer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filePostViewerLoaderHash() =>
    r'432c5e2d04d345b1dd825f55365abe0b246f0338';

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

/// See also [filePostViewerLoader].
@ProviderFor(filePostViewerLoader)
const filePostViewerLoaderProvider = FilePostViewerLoaderFamily();

/// See also [filePostViewerLoader].
class FilePostViewerLoaderFamily extends Family<AsyncValue<void>> {
  /// See also [filePostViewerLoader].
  const FilePostViewerLoaderFamily();

  /// See also [filePostViewerLoader].
  FilePostViewerLoaderProvider call(
    int index,
    int total,
  ) {
    return FilePostViewerLoaderProvider(
      index,
      total,
    );
  }

  @override
  FilePostViewerLoaderProvider getProviderOverride(
    covariant FilePostViewerLoaderProvider provider,
  ) {
    return call(
      provider.index,
      provider.total,
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
  String? get name => r'filePostViewerLoaderProvider';
}

/// See also [filePostViewerLoader].
class FilePostViewerLoaderProvider extends AutoDisposeFutureProvider<void> {
  /// See also [filePostViewerLoader].
  FilePostViewerLoaderProvider(
    int index,
    int total,
  ) : this._internal(
          (ref) => filePostViewerLoader(
            ref as FilePostViewerLoaderRef,
            index,
            total,
          ),
          from: filePostViewerLoaderProvider,
          name: r'filePostViewerLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filePostViewerLoaderHash,
          dependencies: FilePostViewerLoaderFamily._dependencies,
          allTransitiveDependencies:
              FilePostViewerLoaderFamily._allTransitiveDependencies,
          index: index,
          total: total,
        );

  FilePostViewerLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
    required this.total,
  }) : super.internal();

  final int index;
  final int total;

  @override
  Override overrideWith(
    FutureOr<void> Function(FilePostViewerLoaderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilePostViewerLoaderProvider._internal(
        (ref) => create(ref as FilePostViewerLoaderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
        total: total,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FilePostViewerLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilePostViewerLoaderProvider &&
        other.index == index &&
        other.total == total;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);
    hash = _SystemHash.combine(hash, total.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FilePostViewerLoaderRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `index` of this provider.
  int get index;

  /// The parameter `total` of this provider.
  int get total;
}

class _FilePostViewerLoaderProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with FilePostViewerLoaderRef {
  _FilePostViewerLoaderProviderElement(super.provider);

  @override
  int get index => (origin as FilePostViewerLoaderProvider).index;
  @override
  int get total => (origin as FilePostViewerLoaderProvider).total;
}

String _$currentFileIndexPostHash() =>
    r'306352b392e4376a80c8bbaa71aa10dd7ad5981d';

/// See also [CurrentFileIndexPost].
@ProviderFor(CurrentFileIndexPost)
final currentFileIndexPostProvider =
    AutoDisposeNotifierProvider<CurrentFileIndexPost, int>.internal(
  CurrentFileIndexPost.new,
  name: r'currentFileIndexPostProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentFileIndexPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentFileIndexPost = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
