import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:monie_point/colors.dart';
import 'package:monie_point/itemsAdapter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'mc.dart';

class FullDetails extends StatefulWidget {
  final ItemsAdapter i;

  const FullDetails({super.key, required this.i});

  @override
  State<FullDetails> createState() => _FullDetailsState();
}

class _FullDetailsState extends State<FullDetails> with SingleTickerProviderStateMixin {
  TabController? tabController;

  String txt1 = 'Long-sleeve shirt in classic fit featuring button-down collar';
  String txt2 = 'Pitch Pocket on Lest Chest';
  String txt3 = 'Durable Combination Cotton Fabric';
  String txt4 = 'Comfortable and quality chest short';
  String txt5 = 'Go To Classic button down shirt for all special occasions';
  String ch = 'Chat us if there is anything you need to ask about the product :)';

  String rev1 = 'According to my expectations. This is the best. Thank You';
  String rev2 = 'According to my expectations. This is the best. Thank You';
  String rev3 = 'According to my expectations. This is the best. Thank You';

  String rev = 'Popular';
  var revType = ['Popular', 'New', 'All'];

  String nam1 = 'Essentials Mens Shorts';
  String nam2 = 'Essentials Mens Long Trousers';

  static SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light
  );

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios)),
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.pinkAccent),
                      MC.bw(12),
                      const Icon(Icons.share_outlined),
                      MC.bw(12),
                      Stack(
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: MediaQuery.of(context).size.width / 14),
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                border: Border.all(
                                  color: Colors.pinkAccent,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(4)),
                              ),
                              child: MC.txt('1', Colors.white, 10),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MC.bh(16),
                      Container(
                        color: AppColor.colorPrimaryGray,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Image.network(widget.i.image),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Column(
                                children: [
                                  Container(
                                      height: MC.sw(8, context),
                                      width: MC.sw(8, context),
                                      decoration: BoxDecoration(
                                        color: AppColor.colorPrimaryGray,
                                        border: Border.all(
                                          color: AppColor.colorPrimaryGray,
                                          width: 0,
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                                      ),
                                      child: Image.network(widget.i.image,
                                          height: MC.sw(8, context), width: MC.sw(8, context))),
                                  MC.bh(8),
                                  Container(
                                      height: MC.sw(8, context),
                                      width: MC.sw(8, context),
                                      decoration: BoxDecoration(
                                        color: AppColor.colorPrimaryGray,
                                        border: Border.all(
                                          color: AppColor.colorPrimaryGray,
                                          width: 0,
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                                      ),
                                      child: Image.network(widget.i.image,
                                          height: MC.sw(8, context), width: MC.sw(8, context))),
                                  MC.bh(8),
                                  Container(
                                      height: MC.sw(8, context),
                                      width: MC.sw(8, context),
                                      decoration: BoxDecoration(
                                        color: AppColor.colorPrimaryGray,
                                        border: Border.all(
                                          color: AppColor.colorPrimaryGray,
                                          width: 0,
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                                      ),
                                      child: Image.network(widget.i.image,
                                          height: MC.sw(8, context), width: MC.sw(8, context))),
                                  MC.bh(8),
                                  Container(
                                      height: MC.sw(8, context),
                                      width: MC.sw(8, context),
                                      decoration: BoxDecoration(
                                        color: AppColor.colorPrimaryGray,
                                        border: Border.all(
                                          color: AppColor.colorPrimaryGray,
                                          width: 0,
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                                      ),
                                      child: Image.network(widget.i.image,
                                          height: MC.sw(8, context), width: MC.sw(8, context))),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      MC.bh(16),
                      Row(
                        children: [
                          const Icon(Icons.card_travel, size: 24),
                          MC.bw(8),
                          MC.txt('google.id', Colors.grey.withOpacity(0.8), 12),
                        ],
                      ),
                      MC.bh(16),
                      MC.txtB(widget.i.name, Colors.black, 18),
                      MC.bh(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 24,
                              ),
                              MC.txt('${widget.i.ratings} Ratings', Colors.grey, 14),
                            ],
                          ),
                          MC.dot(),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 24,
                              ),
                              MC.txt('2.3k+ Reviews', Colors.grey, 14),
                            ],
                          ),
                          MC.dot(),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 24,
                              ),
                              MC.txt('2.9k+ Sold', Colors.grey, 14),
                            ],
                          ),
                        ],
                      ),
                      MC.bh(16),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            TabBar(
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.green,
                              tabs: const [
                                Tab(
                                  text: 'About Item',
                                ),
                                Tab(
                                  text: 'Reviews',
                                ),
                              ],
                              controller: tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorColor: Colors.green,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                              width: MediaQuery.of(context).size.width,
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Brand:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('ChArmkpR', Colors.black, 14),
                                            ],
                                          ),
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Category:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('Casual Shirt', Colors.black, 14),
                                            ],
                                          ),
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Condition:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('New', Colors.black, 14),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Color:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('Apricot', Colors.black, 14),
                                            ],
                                          ),
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Material:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('Polyester', Colors.black, 14),
                                            ],
                                          ),
                                          MC.bh(16),
                                          Row(
                                            children: [
                                              MC.txt('Heavy:', Colors.grey, 14),
                                              MC.bw(8),
                                              MC.txt('200g', Colors.black, 14),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: MC.txt('No Product Review Yet', Colors.black, 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      MC.line(context),
                      MC.bh(32),
                      MC.txtB('Description', Colors.black, 16),
                      MC.bh(8),
                      desc(txt1),
                      MC.bh(4),
                      desc(txt2),
                      MC.bh(4),
                      desc(txt3),
                      MC.bh(4),
                      desc(txt4),
                      MC.bh(4),
                      desc(txt5),
                      MC.bh(24),
                      MC.txt(ch, Colors.grey, 14),
                      MC.bh(24),
                      Row(
                        children: [
                          MC.txtB('See less', Colors.green, 16),
                          const Icon(Icons.keyboard_arrow_up_rounded, size: 16, color: Colors.grey),
                        ],
                      ),
                      MC.bh(24),
                      MC.line(context),
                      MC.bh(24),
                      MC.txtB('Shipping Information:', Colors.black, 14),
                      MC.bh(16),
                      Row(children: [
                        MC.txt('Delivery:', Colors.grey, 14),
                        MC.bw(8),
                        MC.txt('Shipping from Jakarta, Indonesia', Colors.black, 14),
                      ]),
                      MC.bh(12),
                      Row(children: [
                        MC.txt('Shipping:', Colors.grey, 14),
                        MC.bw(8),
                        MC.txt('FREE International Shipping', Colors.black, 14),
                      ]),
                      MC.bh(12),
                      Row(children: [
                        MC.txt('Arrive:', Colors.grey, 14),
                        MC.bw(8),
                        MC.txt('Estimated arrival on 25 - 27 Oct 2022', Colors.black, 14),
                      ]),
                      MC.bh(24),
                      MC.line(context),
                      MC.bh(24),
                      MC.txtB('Seller Information:', Colors.black, 14),
                      MC.bh(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 6.5,
                            height: MediaQuery.of(context).size.width / 6.5,
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), shape: BoxShape.circle),
                            child: Center(child: MC.txtB('Thrifting \nStore', Colors.black, 11)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MC.txt('Thrifting Store', Colors.black, 14),
                              MC.bh(8),
                              MC.txt('Active 5 Min Ago | 96.7% Positive Feedback', Colors.black, 14),
                              MC.bh(8),
                              Container(
                                  padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent.withOpacity(0.1),
                                    border: Border.all(
                                      color: Colors.green.withOpacity(0.5),
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.shopping_bag_outlined),
                                      MC.txt('Visit Store', Colors.green, 14),
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                      MC.bh(24),
                      MC.txtB('Reviews & Ratings', Colors.black, 14),
                      MC.bh(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(text: widget.i.ratings),
                                      const TextSpan(text: ' /5.0', style: TextStyle(color: Colors.grey, fontSize: 16)),
                                    ],
                                  ),
                                ),
                                MC.bh(4),
                                RatingBar.builder(
                                  initialRating: double.parse(widget.i.ratings),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 16,
                                  itemPadding: const EdgeInsets.only(left: 1),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                  },
                                ),
                                MC.bh(24),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: MC.txt('2.3k+ Reviews', Colors.grey, 14),
                                ),

                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                rate('5', 0.90, '1.5k'),
                                rate('4', 0.45, ' 710'),
                                rate('3', 0.20, ' 140'),
                                rate('2', 0.10, '   10'),
                                rate('1', 0.05, '     4'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      MC.bh(24),
                      MC.txtB('Reviews with images & videos', Colors.black, 14),
                      MC.bh(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          reviewImg(),
                          reviewImg(),
                          reviewImg(),
                          reviewImg(),
                        ],
                      ),
                      MC.bh(24),
                      MC.line(context),
                      MC.bh(24),
                      MC.txtB('Top Reviews', Colors.black, 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: MC.txt('Showing 3 of 2.3k+ review', Colors.grey, 14)),
                          MC.bw(12),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                                ),
                                child: DropdownButton(
                                    underline: Container(),
                                    iconSize: 24,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isDense: true,
                                    isExpanded: false,
                                    value: rev,
                                    items: revType.map((String ls) {
                                      return DropdownMenuItem(value: ls, child: Text(ls));
                                    }).toList(),
                                    onChanged: (String? value) {}),
                              ),
                            ),
                          ),
                        ],
                      ),
                      MC.bh(24),
                      reviews('assets/s1.jpg', 'Sample Name 1', rev1),
                      reviews('assets/s2.jpg', 'Sample Name 2', rev2),
                      reviews('assets/s1.jpg', 'Sample Name 3', rev3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 8, right: 4, bottom: 4, top: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
                              ),
                              MC.bw(12),
                              MC.txt('1', Colors.green, 12),
                              MC.bw(12),
                              MC.txt('2', Colors.black, 12),
                              MC.bw(12),
                              MC.txt('3', Colors.black, 12),
                              MC.bw(12),
                              MC.txt('.....', Colors.black, 16),
                              MC.bw(12),
                              Material(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                elevation: 4,
                                child: Container(
                                  padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 4),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
                                ),
                              ),
                              MC.bw(8),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: MC.txt('See more', Colors.green, 12),
                          )
                        ],
                      ),
                      MC.bh(48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MC.txtB('Recommendation', Colors.black, 16),
                          MC.txt('See More', Colors.green, 16),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: recommend('assets/1.jpg', nam1, '3.7', '2411', '\$24.00')),
                          MC.bw(8),
                          Expanded(child: recommend('assets/2.jpg', nam1, '3.7', '2411', '\$24.00')),
                        ],
                      ),
                      MC.bh(12),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MC.txt('Total Price', Colors.grey, 14),
                      MC.bh(8),
                      MC.txtB(widget.i.price, Colors.green, 24),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(0))),
                        child: Row(
                          children: [
                            const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 16),
                            MC.bw(4),
                            MC.txt('1', Colors.white, 16),
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              border: Border.all(
                                color: Colors.black87,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(4))),
                          child: MC.txt('Buy Now', Colors.white, 16)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  recommend(img, nam, ra, co, pr){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(img),
              const Positioned(right: 0, child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.favorite_border_outlined),
              )),
            ],
          ),
          MC.txt('Shirt', Colors.grey.withOpacity(0.8), 16),
          MC.txtB(nam, Colors.black, 14),
          MC.bh(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  MC.txt(ra, Colors.black54, 14),
                  MC.bw(2),
                  MC.txt('|', Colors.black54, 16),
                  MC.bw(2),
                  MC.txt(co, Colors.black54, 14),
                ],
              ),
              MC.txtB('$pr ', Colors.green, 20),
            ],
          )
        ],
      ),
    );
  }

  desc(t) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: MC.dot(),
        ),
        MC.bw(8),
        Expanded(child: MC.txt(t, Colors.grey, 14)),
      ],
    );
  }

  rate(t, v, c) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        MC.bw(4),
        MC.txt(t, Colors.grey, 14),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 8,
            percent: v,
            barRadius: const Radius.circular(8),
            backgroundColor: Colors.grey.withOpacity(0.4),
            progressColor: Colors.green,
          ),
        ),
        MC.txt(c, Colors.grey, 14),
      ],
    );
  }

  reviewImg() {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        child: Image.network(
          widget.i.image,
          width: MC.sw(5, context),
          height: MC.sw(5, context),
        ));
  }

  reviews(im, nam, t) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: Image.asset(im, width: MC.sw(12, context))),
                  MC.bw(8),
                  MC.txt(nam, Colors.black, 14),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  MC.bw(4),
                  MC.txt(widget.i.ratings, Colors.black, 14),
                  MC.bw(4),
                  MC.txt('*****', Colors.black, 14),
                ],
              ),
            ),
          ],
        ),
        MC.bh(16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.greenAccent.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: MC.txt('Product in good condition', Colors.green, 12),
              ),
              MC.bw(8),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.greenAccent.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: MC.txt('Just as expected', Colors.green, 12),
              ),
              MC.bw(8),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.2),
                    border: Border.all(
                      color: Colors.greenAccent.withOpacity(0.2),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: MC.txt('Really Good Quality Product', Colors.green, 12),
              ),
            ],
          ),
        ),
        MC.bh(16),
        MC.txt(t, Colors.black, 14),
        MC.bh(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.thumb_up, color: Colors.green, size: 16),
                MC.bw(12),
                MC.txt('Helpful ?', Colors.green, 14),
              ],
            ),
            MC.txt('Yesterday', Colors.grey, 14),
          ],
        ),
        MC.bh(24),
        MC.line(context),
        MC.bh(24),
      ],
    );
  }
}
