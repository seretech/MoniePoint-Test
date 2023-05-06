import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:monie_point/itemsAdapter.dart';
import 'package:page_indicator_plus/page_indicator_plus.dart';

import 'colors.dart';
import 'full_details.dart';
import 'mc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController = PageController(initialPage: 0);
  int activeItem = 0;
  bool loading = true;

  List<ItemsAdapter> info_ = [];

  var top = 0.0;

  final List<String> imgList = [
    'assets/img1.jpg',
    'assets/img2.jpg'
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.width / 1.2,
              flexibleSpace: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(),
                          items: imgList
                              .map((item) =>
                              Center(
                                  child:
                                  Image.asset(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width)))
                              .toList(),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Icon(Icons.search,
                                                  color: Colors.grey.withOpacity(0.3), size: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width / 14),
                                              MC.txt('Search', Colors.grey.withOpacity(0.3), 14)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    MC.bw(8),
                                    Stack(
                                      children: [
                                        Icon(Icons.shopping_bag_outlined, size: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 14),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                color: Colors.red,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                                            ),
                                            child: MC.txt('1', Colors.white, 10),
                                          ),
                                        )
                                      ],
                                    ),
                                    MC.bw(8),
                                    Stack(
                                      children: [
                                        Icon(Icons.message_outlined, size: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 14),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                color: Colors.red,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                                            ),
                                            child: MC.txt('9+', Colors.white, 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                MC.bh(24),
                                MC.txt('#CHARITYSALE', Colors.black, 12),
                                MC.bh(4),
                                MC.txtB('DISCOVER OUR\nPRODUCT SELECTION', Colors.black, 16),
                                MC.bh(24),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          bottom: 12,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              border: Border.all(
                                color: Colors.black87,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                            ),
                            child: MC.txt('Check this out', Colors.white, 14),
                          ),
                        )
                      ],
                    ),
                    MC.bh(16),
                    Container(
                      height: MC.sh(8, context),
                      padding: const EdgeInsets.all(12),
                      child: PageView(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          items1(),
                          items2(),
                          items3(),
                        ],
                      ),
                    ),
                    Center(
                      child: PageIndicator(
                        controller: pageController,
                        count: 3,
                        size: 4,
                        layout: PageIndicatorLayout.WARM,
                        color: Colors.grey,
                        activeColor: Colors.black,
                        scale: 0.65,
                        space: 4,
                      ),
                    ),
                  ],
                ),
              ),
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MC.bh(24),
            Expanded(
              child: Container(
                color: AppColor.colorPrimaryGray,
                padding: const EdgeInsets.only(bottom: 12, top: 12, right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MC.txtB('Best Sale Product', Colors.black, 20),
                        MC.bw(8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: MC.txt('See more', Colors.green, 16),
                        )
                      ],
                    ),
                    if(!loading)
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: info_.length,
                          itemBuilder: (context, index) {
                            return itemList(info_[index]);
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: MediaQuery.of(context).size.width /
                                (MediaQuery.of(context).size.height / 1.3),
                          ),
                        ),
                      ),
                    if (loading)
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getData() async {
    Response response = await get(Uri.parse('https://buzzcorner.000webhostapp.com/api/data/a.json'))
        .timeout(const Duration(seconds: 30), onTimeout: () {
      return err();
    },);
    var js = json.decode(response.body);

    if (response.statusCode == 200) {
      final data = js['data'];

      for (var ls in data) {
        ItemsAdapter items = ItemsAdapter(
            ls['id'],
            ls['type'],
            ls['name'],
            ls['image'],
            ls['ratings'],
            ls['count'],
            ls['price']);
        info_.add(items);
      }
      setState(() {
        loading = false;
      });
    } else {
      err();
    }
  }

  itemList(ItemsAdapter items) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => FullDetails(i: items))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(items.image),
                const Positioned(right: 0, child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(Icons.favorite_border_outlined),
                )),
              ],
            ),
            MC.txt(items.type, Colors.grey.withOpacity(0.8), 16),
            MC.txtB(items.name, Colors.black, 14),
            MC.bh(12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      MC.txt(items.ratings, Colors.black54, 14),
                      MC.bw(2),
                      MC.txt('|', Colors.black54, 16),
                      MC.bw(2),
                      MC.txt(items.count, Colors.black54, 14),
                    ],
                  ),
                  MC.txtB('${items.price} ', Colors.green, 20),
                ],
              )
          ],
        ),
      ),
    );
  }

  items1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MC.icTxt(Icons.category_outlined, 'Category', context),
        MC.icTxt(Icons.flight_outlined, 'Flight', context),
        MC.icTxt(Icons.web_asset_outlined, 'Bill', context),
        MC.icTxt(Icons.account_balance_wallet_outlined, 'Data Plan', context),
        MC.icTxt(Icons.monetization_on_outlined, 'Top Up', context),
      ],
    );
  }

  items2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MC.icTxt(Icons.category, 'Others', context),
        MC.icTxt(Icons.flight, 'In-Flight', context),
        MC.icTxt(Icons.web_asset, 'Bill', context),
        MC.icTxt(Icons.account_balance_wallet, 'Data', context),
        MC.icTxt(Icons.monetization_on, 'Top', context),
      ],
    );
  }

  items3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MC.icTxt(Icons.category_outlined, 'Others', context),
        MC.icTxt(Icons.flight_outlined, 'Flights', context),
        MC.icTxt(Icons.web_asset_outlined, 'Bills', context),
        MC.icTxt(Icons.account_balance_wallet_outlined, 'Plans', context),
        MC.icTxt(Icons.monetization_on_outlined, 'Top Ups', context),
      ],
    );
  }

  err() {
    setState(() {
      loading = false;
    });
    MC.ss(context, 'Data Not Found');
  }
}

/*

        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.width / 1.2,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: 0.0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search,
                                          color: Colors.grey.withOpacity(0.3), size: MediaQuery
                                              .of(context)
                                              .size
                                              .width / 14),
                                      MC.txt('Search', Colors.grey.withOpacity(0.3), 14)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            MC.bw(8),
                            Stack(
                              children: [
                                Icon(Icons.shopping_bag_outlined, size: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 14),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: MC.txt('1', Colors.white, 10),
                                  ),
                                )
                              ],
                            ),
                            MC.bw(8),
                            Stack(
                              children: [
                                Icon(Icons.message_outlined, size: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 14),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: MC.txt('9+', Colors.white, 10),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                    ),
                    background: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(),
                                items: imgList
                                    .map((item) =>
                                    Center(
                                        child:
                                        Image.asset(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width)))
                                    .toList(),
                              ),
                              SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey.withOpacity(0.3),
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(4)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.search,
                                                        color: Colors.grey.withOpacity(0.3), size: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width / 14),
                                                    MC.txt('Search', Colors.grey.withOpacity(0.3), 14)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          MC.bw(8),
                                          Stack(
                                            children: [
                                              Icon(Icons.shopping_bag_outlined, size: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width / 14),
                                              Positioned(
                                                right: 0,
                                                child: Container(
                                                  padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                                  ),
                                                  child: MC.txt('1', Colors.white, 10),
                                                ),
                                              )
                                            ],
                                          ),
                                          MC.bw(8),
                                          Stack(
                                            children: [
                                              Icon(Icons.message_outlined, size: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width / 14),
                                              Positioned(
                                                right: 0,
                                                child: Container(
                                                  padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                      color: Colors.red,
                                                    ),
                                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                                  ),
                                                  child: MC.txt('9+', Colors.white, 10),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      MC.bh(24),
                                      MC.txt('#CHARITYSALE', Colors.black, 12),
                                      MC.bh(4),
                                      MC.txtB('DISCOVER OUR\nPRODUCT SELECTION', Colors.black, 16),
                                      MC.bh(24),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                bottom: 12,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    border: Border.all(
                                      color: Colors.black87,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: MC.txt('Check this out', Colors.white, 14),
                                ),
                              )
                            ],
                          ),
                          MC.bh(16),
                          Container(
                            height: MC.sh(8, context),
                            padding: const EdgeInsets.all(12),
                            child: PageView(
                              controller: pageController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                items1(),
                                items2(),
                                items3(),
                              ],
                            ),
                          ),
                          Center(
                            child: PageIndicator(
                              controller: pageController,
                              count: 3,
                              size: 4,
                              layout: PageIndicatorLayout.WARM,
                              color: Colors.grey,
                              activeColor: Colors.black,
                              scale: 0.65,
                              space: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
 */
