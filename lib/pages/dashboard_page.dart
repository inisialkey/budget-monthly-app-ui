import 'package:budget_monthly_ui/json/activity_json.dart';
import 'package:budget_monthly_ui/pages/your_balance_page.dart';
import 'package:budget_monthly_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 350,
            child: Stack(
              children: [
                appBarCurve(context),
                appBarBalance(context),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          getActivity(context),
          const SizedBox(
            height: 35,
          ),
          getVerification(context),
          const SizedBox(
            height: 35,
          ),
          getNewsAndPromo(context),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget appBarCurve(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [primary, secondary]),
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
          ),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const YourBalancePage()),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(fontSize: 22, color: white),
                          ),
                          Text(
                            '1,752',
                            style: TextStyle(fontSize: 30, color: white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Available Balance',
                        style: TextStyle(color: white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1663431512297-993006b0098b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          border: Border.all(color: primary),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarBalance(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spent',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$1,460",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Earned',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$3,850",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "You spent \$1,230 on dining out this month. Let's try to make it lower",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Tell me more',
                  style: TextStyle(
                    fontSize: 15,
                    color: primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getActivity(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Activity",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 25,
            children: List.generate(items.length, (index) {
              return Container(
                width: (size.width / 3) - 30,
                height: (size.width / 3) - 25,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [primary, secondary]),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Icon(
                          items[index]['icon'],
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      items[index]['title'],
                      style: TextStyle(
                          fontSize: 13, color: black.withOpacity(0.5)),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget getVerification(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Complete Verification',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '60%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '3 of 10 completed',
                        style: TextStyle(
                          fontSize: 13,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [primary, secondary],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        MaterialCommunityIcons.account,
                        color: primary,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'When you register for an account',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "we collect personal information",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 15,
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.account,
                        color: primary,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 15,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.email,
                        color: primary,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Confirm Email',
                        style: TextStyle(
                          fontSize: 15,
                          color: black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getNewsAndPromo(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'News and Promo',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/img_promo_news.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Share and invite your friends',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Invite friends to register on our app. For every user you invite, you will earn up to \$10.",
                        style: TextStyle(fontSize: 14, height: 1.6),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Invite Now",
                        style: TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
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
