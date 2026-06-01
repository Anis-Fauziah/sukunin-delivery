import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import 'order_screen.dart';

class CheckoutScreen extends StatelessWidget {
const CheckoutScreen({super.key});

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

final selectedItems =
    cartProvider.cartItems
        .where(
          (item) => item['isSelected'],
        )
        .toList();

return Scaffold(
  appBar: AppBar(
    title: const Text('Checkout'),
  ),

  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),

    child: Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        const Text(
          'Alamat Pengiriman',
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black12,
            ),
          ),

          child: const Text(
            'Jl. Contoh No.123\nTasikmalaya, Jawa Barat',
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Produk Dipilih',
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        ...selectedItems.map(
          (item) => Card(
            child: ListTile(
              leading: Image.asset(
                'assets/images/products/${item['product']['image']}',
                width: 50,
              ),
              title: Text(
                item['product']['flavor'],
              ),
              subtitle: Text(
                '${item['size']} • Qty ${item['quantity']}',
              ),
              trailing: Text(
                formatRupiah(
                  item['price'] *
                      item['quantity'],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black12,
            ),
          ),

          child: const Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                '💵 Cash On Delivery (COD)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Bayar langsung kepada kurir saat pesanan diterima.',
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

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
                cartProvider.totalPrice,
              ),
              style: const TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        SizedBox(
          width: double.infinity,
          height: 55,

          child: ElevatedButton(
            onPressed: () {

              Provider.of<OrderProvider>(
                context,
                listen: false,
              ).addOrder(
                items:
                    List<Map<String, dynamic>>
                        .from(
                  selectedItems,
                ),
                total:
                    cartProvider.totalPrice,
              );

              cartProvider
                  .checkoutSelectedItems();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const OrderScreen(),
                ),
              );
            },

            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.green,
              foregroundColor:
                  Colors.white,
            ),

            child: const Text(
              'Buat Pesanan',
              style: TextStyle(
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
);

}
}
