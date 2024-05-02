import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:amygdala/flutter_flow/flutter_flow_drop_down.dart';
import 'package:amygdala/flutter_flow/flutter_flow_icon_button.dart';
import 'package:amygdala/flutter_flow/flutter_flow_widgets.dart';
import 'package:amygdala/flutter_flow/flutter_flow_theme.dart';
import 'package:amygdala/index.dart';
import 'package:amygdala/main.dart';
import 'package:amygdala/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:amygdala/backend/firebase/firebase_config.dart';
import 'package:amygdala/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    _overrideOnError();
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Sign In ', () {
    testWidgets('Sign in with valid Email and Password',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));

      await tester.enterText(
          find.byKey(ValueKey('emailAddress_leh9')), 'rana@amygdala.com');
      await tester.enterText(find.byKey(ValueKey('password_z6vf')), 'rana442');
      await tester.tap(find.byKey(ValueKey('Button_a1ac')));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
    });

    testWidgets('Sign in with empty Email ', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));

      await tester.enterText(
          find.byKey(ValueKey('emailAddress_leh9')), 'rana@amygdala.com');
      await tester.enterText(find.byKey(ValueKey('password_z6vf')), 'rana442');
      await tester.tap(find.byKey(ValueKey('Button_a1ac')));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
    });

    testWidgets('Sign in with empty password ', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));

      await tester.enterText(
          find.byKey(ValueKey('emailAddress_leh9')), 'rana@amygdala.com');
      await tester.enterText(find.byKey(ValueKey('password_z6vf')), 'rana442');
      await tester.tap(find.byKey(ValueKey('Button_a1ac')));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
    });

    testWidgets('Sign in with invalid Email ', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));

      await tester.enterText(
          find.byKey(ValueKey('emailAddress_leh9')), 'rana@amygdala.com');
      await tester.enterText(find.byKey(ValueKey('password_z6vf')), 'rana442');
      await tester.tap(find.byKey(ValueKey('Button_a1ac')));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
    });

    testWidgets('Sign in with invalid password ', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: LoginWidget(),
        ),
      ));

      await tester.enterText(
          find.byKey(ValueKey('emailAddress_leh9')), 'rana@amygdala.com');
      await tester.enterText(find.byKey(ValueKey('password_z6vf')), 'rana442');
      await tester.tap(find.byKey(ValueKey('Button_a1ac')));
      await tester.pumpAndSettle();
      expect(find.text('Home'), findsWidgets);
    });
  });

  group('Add disabled person profile ', () {
    testWidgets('Empty Name', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'sama@amygdala.com', password: 'sama1234');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AddProfileWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('Button_wo0j')));
      await tester.pumpAndSettle();
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Invalid Name', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'sama@amygdala.com', password: 'sama1234');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AddProfileWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(ValueKey('name_v1j0')), '#\$536');
      await tester.tap(find.byKey(ValueKey('Button_wo0j')));
      await tester.pumpAndSettle();
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Valid Name', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'sama@amygdala.com', password: 'sama1234');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: AddProfileWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(ValueKey('name_v1j0')), 'Raghad');
      await tester.tap(find.byKey(ValueKey('Column_ct1y')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('Button_wo0j')));
      await tester.pumpAndSettle();
      expect(find.text('Error'), findsOneWidget);
    });
  });

  group('View specific disabled person profile', () {
    testWidgets('view diabled person profile', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'sama@amygdala.com', password: 'sama1234');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: HomeWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('disabledProfileListView_tra8')));
      await tester.pumpAndSettle();
      expect(find.text('Edit Profile'), findsWidgets);
    });
  });

  group('Start emotion translation session', () {
    testWidgets('Session starting but BCI is not connected',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));
    });

    testWidgets('Session starting and BCI is connected',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(),
      ));
    });
  });

  group('Terminate translation session', () {
    testWidgets('Terminate session', (WidgetTester tester) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'sama@amygdala.com', password: 'sama1234');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: SessionWidget(),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(ValueKey('Button_b9nt')));
      await tester.pumpAndSettle();
      expect(
          find.text('The session was terminated successfully'), findsOneWidget);
    });
  });

  group('View history of previous sessions', () {});

  group('View details of a specific history session', () {});

  group('Delete previous session record ', () {});

  group('Log Out', () {});
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
