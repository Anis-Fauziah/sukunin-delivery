import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'order_page.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
const CustomerHomeScreen({super.key});

@override
State<CustomerHomeScreen> createState() =>
_CustomerHomeScreenState();
}

class _CustomerHomeScreenState
extends State<CustomerHomeScreen> {

int _selectedIndex = 0;

String searchQuery = '';

void _onItemTapped(int index) {

if (index == 1) {

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) =>
          const OrderPage(),
    ),
  );

  return;
  }

  if (index == 2) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const ProfileScreen(),
      ),
    );

  return;
}

setState(() {
  _selectedIndex = index;
});

}

@override
void initState() {
super.initState();

Future.microtask(() {
  Provider.of<ProductProvider>(
    context,
    listen: false,
  ).fetchProducts();
});

}

@override
Widget build(BuildContext context) {

final productProvider =
    Provider.of<ProductProvider>(
  context,
);

final filteredProducts =
    productProvider.products
        .where((product) {

  return product['flavor']
      .toString()
      .toLowerCase()
      .contains(searchQuery);

}).toList();

return Scaffold(
  backgroundColor:
      const Color(0xFFF5F6F8),

  appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,

    title: Row(
      children: [

        Image.asset(
          'assets/images/logo.png',
          height: 38,
        ),

        const SizedBox(width: 10),

        const Text(
          'Sukunin Delivery',
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    ),

    actions: [

  IconButton(
    onPressed: () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const NotificationScreen(),
        ),
      );
    },

    icon: const Icon(
      Icons.notifications_none,
      color: Colors.black,
    ),
  ),

  IconButton(
    onPressed: () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const CartScreen(),
        ),
      );
    },

    icon: const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.black,
    ),
  ),
],
  ),

  body: productProvider.isLoading
      ? const Center(
          child:
              CircularProgressIndicator(),
        )
      : SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(
                height: 12,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: TextField(
                  onChanged: (value) {

                    setState(() {
                      searchQuery =
                          value.toLowerCase();
                    });
                  },

                  decoration:
                      InputDecoration(
                    hintText:
                        'Cari keripik sukun favoritmu...',
                    prefixIcon:
                        const Icon(
                      Icons.search,
                    ),
                    filled: true,
                    fillColor:
                        Colors.white,

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                              16),
                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                          20),

                  child: Image.asset(
                    'assets/images/banner_utama.png',
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding:
                    EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Text(
                  'Kategori Rasa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              SizedBox(
                height: 50,

                child: ListView(
                  scrollDirection:
                      Axis.horizontal,

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  children: const [

                    _CategoryChip(
                      'Original',
                    ),

                    _CategoryChip(
                      'Balado',
                    ),

                    _CategoryChip(
                      'BBQ',
                    ),

                    _CategoryChip(
                      'Keju',
                    ),

                    _CategoryChip(
                      'Matcha',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                          20),

                  child: Image.asset(
                    'assets/images/banner_ongkir.png',
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              const Padding(
                padding:
                    EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Text(
                  '10 Varian Rasa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount:
                    filteredProducts.length,

                itemBuilder:
                    (context, index) {

                  final product =
                       filteredProducts[index];

                  return Container(
                    margin:
                        const EdgeInsets.fromLTRB(
                      16,
                      12,
                      16,
                      0,
                    ),

                    padding:
                        const EdgeInsets.all(
                            12),

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                              18),
                    ),

                    child: Row(
                      children: [

                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(
                                  14),

                          child:
                              Image.asset(
                            'assets/images/products/${product['image']}',
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(
                          width: 12,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                            children: [

                              Text(
                                product['flavor']
                                    .toString(),

                                style:
                                    const TextStyle(
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  fontSize:
                                      18,
                                ),
                              ),

                              const SizedBox(
                                height: 6,
                              ),

                              Text(
                                product['description']
                                    .toString(),

                                maxLines: 2,
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                              ),

                              const SizedBox(
                                height: 8,
                              ),

                              SizedBox(
                                width:
                                    double.infinity,

                                child:
                                    ElevatedButton(
                                  onPressed:
                                      () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                ProductDetailScreen(
                                          product:
                                              product,
                                        ),
                                      ),
                                    );
                                  },

                                  child:
                                      const Text(
                                    'Pesan Sekarang',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

  bottomNavigationBar:
      BottomNavigationBar(
    currentIndex:
        _selectedIndex,

    onTap:
        _onItemTapped,

    selectedItemColor:
        const Color(
      0xFF2E7D32,
    ),

    items: const [

      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_rounded,
        ),
        label: 'Beranda',
      ),

      BottomNavigationBarItem(
        icon: Icon(
          Icons.receipt_long_rounded,
        ),
        label: 'Pesanan',
      ),

      BottomNavigationBarItem(
    icon: Icon(
      Icons.person_rounded,
    ),
    label: 'Profil',
  ),
    ],
  ),
);

}
}

class _CategoryChip extends StatelessWidget {

final String title;

const _CategoryChip(
this.title,
);

@override
Widget build(
BuildContext context,
) {

return Container(
  margin:
      const EdgeInsets.only(
    right: 10,
  ),

  padding:
      const EdgeInsets.symmetric(
    horizontal: 16,
  ),

  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius:
        BorderRadius.circular(
            30),
  ),

  child: Center(
    child: Text(
      title,
      style: const TextStyle(
        fontWeight:
            FontWeight.bold,
      ),
    ),
  ),
);

}
}
