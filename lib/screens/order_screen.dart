import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  String formatRupiah(int value) {
    return 'Rp ${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider =
        Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pesanan Saya',
        ),
      ),

      body: orderProvider.orders.isEmpty
          ? const Center(
              child: Text(
                'Belum ada pesanan',
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(16),

              itemCount:
                  orderProvider.orders.length,

              itemBuilder:
                  (context, index) {

                final order =
                    orderProvider.orders[index];

                final DateTime? date =
                    order['date'];

                return Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 15,
                  ),

                  padding:
                      const EdgeInsets.all(16),

                  decoration:
                      BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                            12),
                    boxShadow: const [
                      BoxShadow(
                        color:
                            Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          Text(
                            'Pesanan #${index + 1}',
                            style:
                                const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Chip(
                            label: Text(
                              order['status'],
                            ),
                          ),
                        ],
                      ),

                      if (date != null)
                        Padding(
                          padding:
                              const EdgeInsets.only(
                            top: 5,
                          ),
                          child: Text(
                            '${date.day}/${date.month}/${date.year}',
                            style:
                                const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),

                      const SizedBox(
                          height: 10),

                      ...(order['items']
                              as List)
                          .map(
                        (item) => Padding(
                          padding:
                              const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: Text(
                            '${item['product']['flavor']} (${item['size']}) x${item['quantity']}',
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      Text(
                        'Metode : ${order['payment']}',
                      ),

                      const SizedBox(
                          height: 10),

                      Text(
                        formatRupiah(
                          order['total'],
                        ),
                        style:
                            const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}