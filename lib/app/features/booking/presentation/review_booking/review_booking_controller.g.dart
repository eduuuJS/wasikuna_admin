// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewBookingLoaderHash() =>
    r'717d19547752fc0678c2f2e10bd27255d711bb58';

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

/// See also [reviewBookingLoader].
@ProviderFor(reviewBookingLoader)
const reviewBookingLoaderProvider = ReviewBookingLoaderFamily();

/// See also [reviewBookingLoader].
class ReviewBookingLoaderFamily
    extends Family<AsyncValue<BookingDetailDomain>> {
  /// See also [reviewBookingLoader].
  const ReviewBookingLoaderFamily();

  /// See also [reviewBookingLoader].
  ReviewBookingLoaderProvider call(
    String idBooking,
  ) {
    return ReviewBookingLoaderProvider(
      idBooking,
    );
  }

  @override
  ReviewBookingLoaderProvider getProviderOverride(
    covariant ReviewBookingLoaderProvider provider,
  ) {
    return call(
      provider.idBooking,
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
  String? get name => r'reviewBookingLoaderProvider';
}

/// See also [reviewBookingLoader].
class ReviewBookingLoaderProvider
    extends AutoDisposeFutureProvider<BookingDetailDomain> {
  /// See also [reviewBookingLoader].
  ReviewBookingLoaderProvider(
    String idBooking,
  ) : this._internal(
          (ref) => reviewBookingLoader(
            ref as ReviewBookingLoaderRef,
            idBooking,
          ),
          from: reviewBookingLoaderProvider,
          name: r'reviewBookingLoaderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reviewBookingLoaderHash,
          dependencies: ReviewBookingLoaderFamily._dependencies,
          allTransitiveDependencies:
              ReviewBookingLoaderFamily._allTransitiveDependencies,
          idBooking: idBooking,
        );

  ReviewBookingLoaderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idBooking,
  }) : super.internal();

  final String idBooking;

  @override
  Override overrideWith(
    FutureOr<BookingDetailDomain> Function(ReviewBookingLoaderRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReviewBookingLoaderProvider._internal(
        (ref) => create(ref as ReviewBookingLoaderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idBooking: idBooking,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<BookingDetailDomain> createElement() {
    return _ReviewBookingLoaderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReviewBookingLoaderProvider && other.idBooking == idBooking;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idBooking.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReviewBookingLoaderRef
    on AutoDisposeFutureProviderRef<BookingDetailDomain> {
  /// The parameter `idBooking` of this provider.
  String get idBooking;
}

class _ReviewBookingLoaderProviderElement
    extends AutoDisposeFutureProviderElement<BookingDetailDomain>
    with ReviewBookingLoaderRef {
  _ReviewBookingLoaderProviderElement(super.provider);

  @override
  String get idBooking => (origin as ReviewBookingLoaderProvider).idBooking;
}

String _$reviewBookingControllerHash() =>
    r'1b25cbfc2ba0ccd2cfd5e006c958764945bd447f';

/// See also [ReviewBookingController].
@ProviderFor(ReviewBookingController)
final reviewBookingControllerProvider =
    AutoDisposeNotifierProvider<ReviewBookingController, void>.internal(
  ReviewBookingController.new,
  name: r'reviewBookingControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reviewBookingControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReviewBookingController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
