import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/app_state.dart';

void main() {
  test('Initialize GSLAppState', () {
    final appState = GSLAppState();
    expect(appState.categoryName, ''); // Initially, categoryName should be an empty string.
  });

  test('Update categoryName', () {
    final appState = GSLAppState();
    appState.categoryName = 'Test Category';
    expect(appState.categoryName, 'Test Category');
  });

  test('Notify listeners after update', () {
    final appState = GSLAppState();
    int callbackCount = 0;

    // Create a callback that increments callbackCount.
    void callback() {
      callbackCount++;
    }

    // Attach a listener to the appState.
    appState.addListener(callback);

    // Update the appState, which should trigger the listener.
    appState.update(() {});

    // Verify that the listener was called and callbackCount incremented.
    expect(callbackCount, 1);
  });

  test('Remove listener', () {
    final appState = GSLAppState();
    int callbackCount = 0;

    // Create a callback that increments callbackCount.
    void callback() {
      callbackCount++;
    }

    // Attach a listener to the appState.
    appState.addListener(callback);

    // Update the appState, which should trigger the listener.
    appState.update(() {});

    // Remove the listener.
    appState.removeListener(callback);

    // Update the appState again, but the listener should not be called.
    appState.update(() {});

    // Verify that the listener was called only once.
    expect(callbackCount, 1);
  });
}
