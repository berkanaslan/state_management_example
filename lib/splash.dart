import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_state_management/user_repository.dart';
import 'package:flutter_state_management/user_stream.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class ProviderwithFirebaseAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserRepository userRepo, child) {
      switch (userRepo.userStatus) {
        case UserStatus.Idle:
          return SplashEkran();
        case UserStatus.LoggingIn:
        case UserStatus.NotLoggedIn:
          return LoginPage();
        case UserStatus.LoggedIn:
          return KullaniciEkrani();
      }
    });
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Ekran"),
      ),
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}