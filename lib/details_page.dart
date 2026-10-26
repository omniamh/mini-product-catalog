import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String price;

  DetailsPage({required this.name, required this.price});

  @override
  State<DetailsPage> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    print("DetailsPage: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("DetailsPage: didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant DetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("DetailsPage: didUpdateWidget");
  }

  @override
  void deactivate() {
    print("DetailsPage: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("DetailsPage: dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("DetailsPage: build");

    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product: ${widget.name}", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("Price: \$${widget.price}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Part 3 & 4: go_router pop with return message
                context.pop("${widget.name} added to cart");

                // Part 2: Navigator.pop (Commented out)
                // Navigator.of(context).pop("${widget.name} added to cart");
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}