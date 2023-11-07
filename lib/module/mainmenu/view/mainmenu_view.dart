import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart';
import '../controller/mainmenu_controller.dart';

class MainmenuView extends StatefulWidget {
  const MainmenuView({Key? key}) : super(key: key);

  Widget build(context, MainmenuController controller) {
    controller.view = this;

    return Scaffold(
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_checkout_outlined,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_2_outlined,
                    size: 24.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 218, 206, 206),
                  ),
                  child: Column(
                    //crostart (memberi intruksi gambar kepinggir)
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOjRaUrnHjF6OTe_JP9k3UkKyGstP9z-e79mI9gt-M0MLHhr7xhulh2Qrh8QqHHrrFQ5s&usqp=CAU",
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "SELAMAT DATANG DI RUMAH MAKAN NUSANTARA",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      const Text(
                        "(RAYFANDRA DEVANO F)",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      const Text(
                        "Menyediakan berbagai masakan tradisional",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.kategori.length,
                              (index) {
                            var item = controller.kategori[index];
                            bool gantiwarna =
                                controller.pilihkategoriIndex == index;
                            return Container(
                              margin: const EdgeInsets.only(
                                right: 15.0,
                              ),
                              child: Text(
                                "$item",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: gantiwarna ? Colors.red : Colors.red,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(controller.products.length,
                              (index) {
                            var item = controller.products[index];
                            return SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      right: 12.0,
                                    ),
                                    height: 160.0,
                                    width: 160,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item["photo"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item["product_name"],
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Rp${item["price"]}K",
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.add,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Daftar Menu",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://marketplace.canva.com/EAFq0tnAw7Q/1/0/1131w/canva-cokelat-%26-krem-moderen-kafe-restoran-food-menu-sdnTLmVrVNA.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              8.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.0 / 1.4,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: controller.products.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.products[index];
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          item["photo"],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          6.0,
                                        ),
                                      ),
                                    ),
                                    child: const Stack(
                                      children: [
                                        Positioned(
                                          right: 6.0,
                                          top: 8.0,
                                          child: CircleAvatar(
                                            radius: 14.0,
                                            backgroundColor: Color.fromARGB(
                                                255, 250, 246, 246),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  item["product_name"],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  item["category"],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "${item["price"]}",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<MainmenuView> createState() => MainmenuController();
}
