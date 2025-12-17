import 'package:aims2frontend/screens/landing/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'admin/AdminLogin.dart';
import 'admin/AdminPage.dart';

import 'auth/forgot_password_page.dart';
import 'user/UserLoginPage.dart';
import 'UserPage.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LandingPage(),
    ),


    GoRoute(
      path: '/admin',
      builder: (_, __) => const AdminPage(),
    ),

    GoRoute(
      path: '/admin-offline',
      builder: (_, __) => const AdminPage(forceOffline: true),
    ),

    GoRoute(
      path: '/user',
      builder: (context, state) => const UserPage(),
    ),


    /// ADMIN LOGIN
    GoRoute(
      path: '/login/admin',
      builder: (context, state) => const AdminLoginPage(),
    ),

    /// USER LOGIN
    GoRoute(
      path: '/login/user',
      builder: (context, state) => const UserLoginPage(),
    ),

  ],
);
