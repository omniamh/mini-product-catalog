// ============================================================
// PART 1 (Question 5) & PART 4: Short Answers & Lifecycle Observations
// ============================================================
//
// --- Part 1 (Question 5): Lifecycle Observations ---
// a) Which methods run when a page opens for the first time?
//    Answer: initState() -> didChangeDependencies() -> build()
//
// b) Which method runs again after you press the heart button?
//    Answer: build() only (because setState() triggers a rebuild without re-running initState).
//
// c) Which methods run when you leave a page and go back?
//    - When leaving: deactivate() -> dispose() (if destroyed) or just covered.
//    - When coming back: initState() -> didChangeDependencies() -> build() (if pushed/popped).
//
// d) Which methods run when you resize the browser window, and why?
//    Answer: didChangeDependencies() and build() run because resizing changes the constraints/MediaQuery,
//    which updates inherited widgets and forces the widget to rebuild.
//
// --- Part 4: Short Answers ---
// 1. What is the difference between context.go and context.push? Give one example from your app for each.
//    - context.go: Replaces the current navigation stack completely (changes URL and clears history).
//      Example: From Login to Products (we don't want the user to press back to return to the login screen).
//    - context.push: Pushes a new route on top of the current stack while keeping the previous screen in memory.
//      Example: From Products to Details (so the user can press back or return a result).
//
// 2. Why did we use go for Login → Products and push for Product → Details?
//    - We used 'go' for Login → Products because a logged-in user shouldn't be able to press the "Back" button
//      and return to the blank login screen.
//    - We used 'push' for Products → Details because the user needs to return back to the products list after viewing details.
//
// 3. What is the difference between a path parameter and a query parameter? Show one URL from your app for each.
//    - Path parameter: A mandatory part of the URL route structure itself (e.g., /details/Laptop/1200).
//    - Query parameter: Optional or extra key-value pairs appended after a question mark (e.g., /products?user=Guest).
// ============================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'login_page.dart';
import 'products_page.dart';
import 'details_page.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: "products",
      path: "/products",
      builder: (context, state) {
        final username = state.uri.queryParameters['user'] ?? "Guest";
        return ProductsPage(username: username);
      },
    ),
    GoRoute(
      name: "details",
      path: "/details/:name/:price",
      builder: (context, state) {
        final name = state.pathParameters['name'] ?? "";
        final price = state.pathParameters['price'] ?? "";
        return DetailsPage(name: name, price: price);
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    // Part 2: Navigator Code (Commented out as requested)
    return MaterialApp(
      title: "Mini Product Catalog",
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/products": (context) => ProductsPage(username: "Guest"),
      },
    );
    */

    // Part 3: go_router active setup
    return MaterialApp.router(
      title: "Mini Product Catalog",
      routerConfig: _router,
    );
  }
}
