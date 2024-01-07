import 'package:flutter/material.dart';
import 'package:increase_decrease_qty/application/qty.state.dart';
import 'package:provider/provider.dart';

class QtyWidget extends StatelessWidget {
  const QtyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var qtyProvider = Provider.of<QtyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Provider",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        const Center(
          child: Text(
            "Say No To SetState",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              color: Colors.amber.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/banana.png",
                      width: 80,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Banana",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              "GHS 50.00",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            IncreOrDecreWidget(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Total",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "${qtyProvider.totalprice}",
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}

class IncreOrDecreWidget extends StatelessWidget {
  const IncreOrDecreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var qtyProvider = Provider.of<QtyProvider>(context, listen: true);
    return Row(
      children: [
        InkWell(
          onTap: () {
            qtyProvider.decrement(value: 1, price: 50);
          },
          child: const CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.remove,
                size: 20,
              )),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          "${qtyProvider.totalQty}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () {
            qtyProvider.increment(value: 1, price: 50);
          },
          child: const CircleAvatar(
            radius: 15,
            child: Icon(
              Icons.add,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
