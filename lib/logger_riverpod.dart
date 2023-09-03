import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/user_repository.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    debugPrint(
        "didUpdateProvider: $provider, $previousValue, $newValue, did userRepositoryProvider: ${container.exists(userRepositoryProvider)}, debugChildren ${container.debugChildren}, depth ${container.depth}, readProviderElement: ${container.readProviderElement(provider)}, read: ${container.read(provider)}");
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    super.didAddProvider(provider, value, container);

    debugPrint(
        "didAddProvider: $provider, $value, ${container.getAllProviderElements()}");
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    debugPrint("didDisposeProvider: $provider, $container");
  }
}

