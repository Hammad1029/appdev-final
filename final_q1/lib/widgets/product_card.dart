import 'package:firebase_todo/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      product.image.toString(),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          product.name.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            "${product.color.toString()}, ${product.size.toString()}"),
                        Text("Rp ${product.price.toString()}", style: const TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Chip(
                  label: Text(
                    product.status.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.lightGreen,
                )
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "ID Order",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            Text(product.orderId.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total Items",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            Text(product.quantity.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
              onPressed: () {},
              child: const Icon(Icons.message),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ))),
                onPressed: () {},
                child: const Text("View Reviews")),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.orange),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
              onPressed: () {},
              child: const Text(
                "Buy Again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
