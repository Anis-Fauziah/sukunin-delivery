import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  String formatRupiah(int value) {
    return 'Rp ${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider =
        Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang Saya',
        ),
      ),

      body: cartProvider.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Keranjang masih kosong',
              ),
            )
          : Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    itemCount:
                        cartProvider
                            .cartItems
                            .length,

                    itemBuilder:
                        (context, index) {

                      final item =
                          cartProvider
                              .cartItems[index];

                      return Card(
                        margin:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  12),
                        ),

                        child: Padding(
                          padding:
                              const EdgeInsets.all(
                                  10),

                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,

                            children: [

                              Checkbox(
                                value:
                                    item['isSelected'],

                                onChanged: (value) {
                                  cartProvider
                                      .toggleSelection(
                                    index,
                                  );
                                },
                              ),

                              ClipRRect(
                                borderRadius:
                                    BorderRadius
                                        .circular(10),

                                child: Image.asset(
                                  'assets/images/products/${item['product']['image']}',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(
                                  width: 10),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                  children: [

                                    Text(
                                      item['product']
                                              ['flavor']
                                          .toString(),

                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        fontSize: 18,
                                      ),
                                    ),

                                    const SizedBox(
                                        height: 5),

                                    Text(
                                      item['size'],
                                    ),

                                    const SizedBox(
                                        height: 5),

                                    Text(
                                      'Qty ${item['quantity']}',
                                    ),

                                    const SizedBox(
                                        height: 5),

                                    Text(
                                      formatRupiah(
                                        item['price'] *
                                            item[
                                                'quantity'],
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
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),

                                onPressed: () {
                                  cartProvider
                                      .removeItem(
                                    index,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding:
                      const EdgeInsets.all(16),

                  decoration:
                      const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color:
                            Colors.black12,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Text(
                            formatRupiah(
                              cartProvider
                                  .totalPrice,
                            ),

                            style:
                                const TextStyle(
                              fontSize: 24,
                              color:
                                  Colors.green,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 15),

                      SizedBox(
                        width:
                            double.infinity,
                        height: 50,

                        child:
                            ElevatedButton(
                          onPressed: () {},

                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                Colors.green,
                            foregroundColor:
                                Colors.white,
                          ),

                          child: Text(
                            'Checkout (${cartProvider.selectedCount})',
                            style:
                                const TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}