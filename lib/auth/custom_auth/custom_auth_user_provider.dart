import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class QuisineAuthUser {
  QuisineAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<QuisineAuthUser> quisineAuthUserSubject =
    BehaviorSubject.seeded(QuisineAuthUser(loggedIn: false));
Stream<QuisineAuthUser> quisineAuthUserStream() => quisineAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
