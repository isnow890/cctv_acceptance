// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cctv_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cctvsHash() => r'9fa93131853ad7ccd68669610860e719e672bf2d';

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

/// See also [cctvs].
@ProviderFor(cctvs)
const cctvsProvider = CctvsFamily();

/// See also [cctvs].
class CctvsFamily extends Family<AsyncValue<List<CctvListResModel>>> {
  /// See also [cctvs].
  const CctvsFamily();

  /// See also [cctvs].
  CctvsProvider call({
    required String HSP_TP_CD,
    required String REQ_ID,
    required String SID,
  }) {
    return CctvsProvider(
      HSP_TP_CD: HSP_TP_CD,
      REQ_ID: REQ_ID,
      SID: SID,
    );
  }

  @override
  CctvsProvider getProviderOverride(
    covariant CctvsProvider provider,
  ) {
    return call(
      HSP_TP_CD: provider.HSP_TP_CD,
      REQ_ID: provider.REQ_ID,
      SID: provider.SID,
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
  String? get name => r'cctvsProvider';
}

/// See also [cctvs].
class CctvsProvider extends AutoDisposeFutureProvider<List<CctvListResModel>> {
  /// See also [cctvs].
  CctvsProvider({
    required String HSP_TP_CD,
    required String REQ_ID,
    required String SID,
  }) : this._internal(
          (ref) => cctvs(
            ref as CctvsRef,
            HSP_TP_CD: HSP_TP_CD,
            REQ_ID: REQ_ID,
            SID: SID,
          ),
          from: cctvsProvider,
          name: r'cctvsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cctvsHash,
          dependencies: CctvsFamily._dependencies,
          allTransitiveDependencies: CctvsFamily._allTransitiveDependencies,
          HSP_TP_CD: HSP_TP_CD,
          REQ_ID: REQ_ID,
          SID: SID,
        );

  CctvsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.HSP_TP_CD,
    required this.REQ_ID,
    required this.SID,
  }) : super.internal();

  final String HSP_TP_CD;
  final String REQ_ID;
  final String SID;

  @override
  Override overrideWith(
    FutureOr<List<CctvListResModel>> Function(CctvsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CctvsProvider._internal(
        (ref) => create(ref as CctvsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        HSP_TP_CD: HSP_TP_CD,
        REQ_ID: REQ_ID,
        SID: SID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CctvListResModel>> createElement() {
    return _CctvsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CctvsProvider &&
        other.HSP_TP_CD == HSP_TP_CD &&
        other.REQ_ID == REQ_ID &&
        other.SID == SID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, HSP_TP_CD.hashCode);
    hash = _SystemHash.combine(hash, REQ_ID.hashCode);
    hash = _SystemHash.combine(hash, SID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CctvsRef on AutoDisposeFutureProviderRef<List<CctvListResModel>> {
  /// The parameter `HSP_TP_CD` of this provider.
  String get HSP_TP_CD;

  /// The parameter `REQ_ID` of this provider.
  String get REQ_ID;

  /// The parameter `SID` of this provider.
  String get SID;
}

class _CctvsProviderElement
    extends AutoDisposeFutureProviderElement<List<CctvListResModel>>
    with CctvsRef {
  _CctvsProviderElement(super.provider);

  @override
  String get HSP_TP_CD => (origin as CctvsProvider).HSP_TP_CD;
  @override
  String get REQ_ID => (origin as CctvsProvider).REQ_ID;
  @override
  String get SID => (origin as CctvsProvider).SID;
}

String _$updateCctvResponseHash() =>
    r'6e2ef2ef17203cc5045ddcdb207838ae148955d5';

/// See also [updateCctvResponse].
@ProviderFor(updateCctvResponse)
const updateCctvResponseProvider = UpdateCctvResponseFamily();

/// See also [updateCctvResponse].
class UpdateCctvResponseFamily extends Family<AsyncValue<String>> {
  /// See also [updateCctvResponse].
  const UpdateCctvResponseFamily();

  /// See also [updateCctvResponse].
  UpdateCctvResponseProvider call({
    required CctvUpdateReqModel body,
  }) {
    return UpdateCctvResponseProvider(
      body: body,
    );
  }

  @override
  UpdateCctvResponseProvider getProviderOverride(
    covariant UpdateCctvResponseProvider provider,
  ) {
    return call(
      body: provider.body,
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
  String? get name => r'updateCctvResponseProvider';
}

/// See also [updateCctvResponse].
class UpdateCctvResponseProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateCctvResponse].
  UpdateCctvResponseProvider({
    required CctvUpdateReqModel body,
  }) : this._internal(
          (ref) => updateCctvResponse(
            ref as UpdateCctvResponseRef,
            body: body,
          ),
          from: updateCctvResponseProvider,
          name: r'updateCctvResponseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCctvResponseHash,
          dependencies: UpdateCctvResponseFamily._dependencies,
          allTransitiveDependencies:
              UpdateCctvResponseFamily._allTransitiveDependencies,
          body: body,
        );

  UpdateCctvResponseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final CctvUpdateReqModel body;

  @override
  Override overrideWith(
    FutureOr<String> Function(UpdateCctvResponseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCctvResponseProvider._internal(
        (ref) => create(ref as UpdateCctvResponseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UpdateCctvResponseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCctvResponseProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCctvResponseRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `body` of this provider.
  CctvUpdateReqModel get body;
}

class _UpdateCctvResponseProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with UpdateCctvResponseRef {
  _UpdateCctvResponseProviderElement(super.provider);

  @override
  CctvUpdateReqModel get body => (origin as UpdateCctvResponseProvider).body;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
