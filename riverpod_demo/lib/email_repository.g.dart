// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isEmailValid)
final isEmailValidProvider = IsEmailValidFamily._();

final class IsEmailValidProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsEmailValidProvider._({
    required IsEmailValidFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isEmailValidProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isEmailValidHash();

  @override
  String toString() {
    return r'isEmailValidProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isEmailValid(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsEmailValidProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isEmailValidHash() => r'4ef2cdae4c4db7d9d8e8761f621c6d5514caec4a';

final class IsEmailValidFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  IsEmailValidFamily._()
    : super(
        retry: null,
        name: r'isEmailValidProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsEmailValidProvider call(String email) =>
      IsEmailValidProvider._(argument: email, from: this);

  @override
  String toString() => r'isEmailValidProvider';
}
