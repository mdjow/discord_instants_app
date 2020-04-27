import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:mobx/mobx.dart";

part "store.g.dart";

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    _auth.onAuthStateChanged.listen((snapshot) => user = snapshot);
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      "email",
    ],
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  FirebaseUser user;

  @observable
  AuthCredential credential;

  @computed
  bool get logged => user != null;

  @action
  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();
    user = null;
  }

  @action
  Future<void> signIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }
}
