import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_todo/models/product_model.dart';
import 'package:firebase_todo/providers/product_provider.dart';
import 'package:firebase_todo/widgets/product_card.dart';
import 'package:firebase_todo/widgets/search.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    final productNotifier = ref.watch(productProvider);
    final statusNotifier = ref.watch(statusFilterProvider);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Search(
                onChanged: (value) {
                  // Handle the text change here
                  setState(() {
                    search = value;
                  });
                },
              ))
            ],
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          statusNotifier == "Processing"
                              ? Colors.black
                              : const Color(0xffF9F9F9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                  onPressed: () {
                    ref.read(statusFilterProvider.state).state = 'Processing';
                  },
                  child: Text("Processing",
                      style: TextStyle(
                          color: statusNotifier == "Processing"
                              ? Colors.white
                              : Colors.black)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          statusNotifier == "Shipped"
                              ? Colors.black
                              : const Color(0xffF9F9F9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                  onPressed: () {
                    ref.read(statusFilterProvider.state).state = 'Shipped';
                  },
                  child: Text("Shipped",
                      style: TextStyle(
                          color: statusNotifier == "Shipped"
                              ? Colors.white
                              : Colors.black)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          statusNotifier == "Returns"
                              ? Colors.black
                              : const Color(0xffF9F9F9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                  onPressed: () {
                    ref.read(statusFilterProvider.state).state = 'Returns';
                  },
                  child: Text("Returns",
                      style: TextStyle(
                          color: statusNotifier == "Returns"
                              ? Colors.white
                              : Colors.black)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          statusNotifier == "Cancelled"
                              ? Colors.black
                              : const Color(0xffF9F9F9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                  onPressed: () {
                    ref.read(statusFilterProvider.state).state = 'Cancelled';
                  },
                  child: Text("Cancelled",
                      style: TextStyle(
                          color: statusNotifier == "Cancelled"
                              ? Colors.white
                              : Colors.black)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          statusNotifier == "Cancelled"
                              ? Colors.black
                              : const Color(0xffF9F9F9)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                  onPressed: () {
                    ref.read(statusFilterProvider.state).state = 'Cancelled';
                  },
                  child: Text("Processing",
                      style: TextStyle(
                          color: statusNotifier == "Processing"
                              ? Colors.white
                              : Colors.black)),
                ),
              ],
            ),
          ),
          productNotifier.when(
            data: (value) {
              List<Product> filteredProducts = value.where((product) {
                return product.name
                    .toString()
                    .toLowerCase()
                    .startsWith(search.toLowerCase());
              }).toList();

              return Expanded(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ProductCard(product: filteredProducts[index]),
                        const Divider(),
                      ],
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
