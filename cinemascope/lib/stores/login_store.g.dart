// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$askPermissionDataAtom = Atom(name: '_LoginStore.askPermissionData');

  @override
  LoginAskPermissionData get askPermissionData {
    _$askPermissionDataAtom.reportRead();
    return super.askPermissionData;
  }

  @override
  set askPermissionData(LoginAskPermissionData value) {
    _$askPermissionDataAtom.reportWrite(value, super.askPermissionData, () {
      super.askPermissionData = value;
    });
  }

  final _$loginStepAtom = Atom(name: '_LoginStore.loginStep');

  @override
  LoginStep get loginStep {
    _$loginStepAtom.reportRead();
    return super.loginStep;
  }

  @override
  set loginStep(LoginStep value) {
    _$loginStepAtom.reportWrite(value, super.loginStep, () {
      super.loginStep = value;
    });
  }

  final _$createRequestTokenAsyncAction =
      AsyncAction('_LoginStore.createRequestToken');

  @override
  Future<void> createRequestToken() {
    return _$createRequestTokenAsyncAction
        .run(() => super.createRequestToken());
  }

  final _$createAccessTokenAsyncAction =
      AsyncAction('_LoginStore.createAccessToken');

  @override
  Future<void> createAccessToken() {
    return _$createAccessTokenAsyncAction.run(() => super.createAccessToken());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void performFakeLogin() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.performFakeLogin');
    try {
      return super.performFakeLogin();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _login() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore._login');
    try {
      return super._login();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
askPermissionData: ${askPermissionData},
loginStep: ${loginStep}
    ''';
  }
}
