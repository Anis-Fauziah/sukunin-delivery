import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {

  int quantity = 1;

  String selectedSize = '150gr';

  final Map<String, int> prices = {
    '150gr': 8000,
    '250gr': 12000,
    '500gr': 22000,
    '1kg': 40000,
  };

  String formatRupiah(int value) {
    return 'Rp ${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {

    final int price =
        prices[selectedSize]!;

    final int total =
        price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product['flavor'],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            ClipRRect(
              borderRadius:
                  BorderRadius.circular(20),

              child: Image.asset(
                'assets/images/products/${widget.product['image']}',
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.product['flavor'],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.product['description'],
            ),

            const SizedBox(height: 20),

            Text(
              formatRupiah(price),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Pilih Ukuran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: [
                _buildSizeChip('150gr'),
                _buildSizeChip('250gr'),
                _buildSizeChip('500gr'),
                _buildSizeChip('1kg'),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),

                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              'Total',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              formatRupiah(total),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {

                  final int price =
                      prices[selectedSize]!;

                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).addToCart(
                    widget.product,
                    selectedSize,
                    quantity,
                    price,
                  );
                  
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Produk berhasil ditambahkan ke keranjang',
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green,
                  foregroundColor:
                      Colors.white,
                ),

                child: const Text(
                  'Tambah ke Keranjang',
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

  Widget _buildSizeChip(
      String size) {

    final bool selected =
        selectedSize == size;

    return ChoiceChip(
      label: Text(size),

      selected: selected,

      onSelected: (value) {
        setState(() {
          selectedSize = size;
        });
      },

      selectedColor:
          Colors.green,

      labelStyle: TextStyle(
        color: selected
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}