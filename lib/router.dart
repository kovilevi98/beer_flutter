import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:punk/domain/entities/beer.dart';
import 'package:punk/presentation/screens/beers/beers_screen.dart';
import 'package:punk/presentation/screens/detail/details_screen.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const BeersScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.details,
            builder: (BuildContext context, GoRouterState state) {
              final beer = state.extra as Beer;
              return DetailsScreen(
                beer: beer,
              );
            },
          ),
        ],
      ),
    ],
  );
}

class Routes{
 static const String home = '/';
 static const String details = 'details';
}
