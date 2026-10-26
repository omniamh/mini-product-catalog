import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'product_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String username;

  ProductsPage({required this.username});

  @override
  State<ProductsPage> createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  int favorites = 0;
  double screenWidth = 0;

  final List<Map<String, dynamic>> productsList = [
    {"name": "Laptop", "price": 1200},
    {"name": "Smartphone", "price": 800},
    {"name": "Headphones", "price": 150},
    {"name": "Smartwatch", "price": 250},
  ];

  String cartMessage = "";

  @override
  void initState() {
    super.initState();
    print("ProductsPage: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    print("ProductsPage: didChangeDependencies -> width: ${size.width}, height: ${size.height}");
  }

  @override
  void didUpdateWidget(covariant ProductsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("ProductsPage: didUpdateWidget");
  }

  @override
  void deactivate() {
    print("ProductsPage: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("ProductsPage: dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("ProductsPage: build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${widget.username}"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Favorites: $favorites", style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Screen width: ${screenWidth.toStringAsFixed(1)}"),
          ),
          if (cartMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(cartMessage, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          Expanded(
            child: screenWidth < 600
                ? ProductsListView(
              products: productsList,
              onFavoritePressed: () {
                setState(() {
                  favorites++;
                });
              },
              onProductTap: (index) async {
                String productName = productsList[index]["name"];
                int productPrice = productsList[index]["price"];

                // Part 3: go_router context.push and await result
                final result = await context.push<String>(
                  "/details/$productName/$productPrice",
                );

                if (result != null) {
                  setState(() {
                    cartMessage = result;
                  });
                }

                // Part 2: Navigator.push (Commented out)
                /*
                      final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(name: productName, price: productPrice),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          cartMessage = result;
                        });
                      }
                      */
              },
            )
                : ProductsGridView(
              products: productsList,
              onFavoritePressed: () {
                setState(() {
                  favorites++;
                });
              },
              onProductTap: (index) async {
                String productName = productsList[index]["name"];
                int productPrice = productsList[index]["price"];

                final result = await context.push<String>(
                  "/details/$productName/$productPrice",
                );

                if (result != null) {
                  setState(() {
                    cartMessage = result;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
