import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

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
      backgroundColor:
          const Color(0xFFF5F6F8),

      appBar: AppBar(
        title: const Text(
          'Pesanan Saya',
        ),
      ),

      body: orderProvider.orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.receipt_long,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Belum ada pesanan',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
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

                return Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 16,
                  ),

                  decoration:
                      BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(
                            16),
                    boxShadow: const [
                      BoxShadow(
                        color:
                            Colors.black12,
                        blurRadius: 4,
                      ),
                    ],
                  ),

                  child: Padding(
                    padding:
                        const EdgeInsets.all(
                            16),

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
                                fontWeight:
                                    FontWeight
                                        .bold,
                                fontSize: 18,
                              ),
                            ),

                            Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal:
                                    12,
                                vertical:
                                    6,
                              ),

                              decoration:
                                  BoxDecoration(
                                color:
                                    Colors.orange
                                        .shade100,

                                borderRadius:
                                    BorderRadius.circular(
                                        20),
                              ),

                              child:
                                  const Text(
                                'Diproses',
                                style:
                                    TextStyle(
                                  color:
                                      Colors.orange,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 10),

                        ...(order['items']
                                as List)
                            .map(
                          (item) => Padding(
                            padding:
                                const EdgeInsets
                                    .only(
                              bottom: 6,
                            ),

                            child: Text(
                              '${item['product']['flavor']} (${item['size']}) x${item['quantity']}',
                            ),
                          ),
                        ),

                        const Divider(),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                          children: [

                            const Text(
                              'Metode',
                            ),

                            Text(
                              order['payment'],
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 8),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                          children: [

                            const Text(
                              'Total',
                            ),

                            Text(
                              formatRupiah(
                                order[
                                    'total'],
                              ),

                              style:
                                  const TextStyle(
                                color:
                                    Colors.green,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}