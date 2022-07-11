import 'package:flutter/material.dart';
import 'package:syndicate/main.dart';
import 'package:syndicate/model.dart/transaction.dart';
import 'package:syndicate/screens/customers_screen.dart';
import 'package:syndicate/widgets/transcation_card.dart';

import '../repository/customer_database.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<TransactionList> list;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    transactionList();
  }

  Future transactionList() async {
    setState(() {
      isLoading = true;
    });

    list = await CustomerDatabase.instance.readAllTransactions();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(128, 51, 64, 79),
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/ecommerce_logo.png',
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Syndicate',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white, fontSize: 18),
            )
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Hi, Arthur',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.white, fontSize: 64),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Here's Your Balance",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SAVINGS',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '\$15,600',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 180,
                        height: 12,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.7,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff00ff00)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ASSETS',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '\$9,615',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 150,
                        height: 12,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.3,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 65, 67, 67)),
                            backgroundColor: Color(0xffD6D6D6),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: FloatingActionButton(
                                      backgroundColor: Colors.lightGreen,
                                      splashColor: Colors.orange,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CustomerScreen()));
                                      },
                                      child: Center(
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                            Icon(
                                              Icons.arrow_back_sharp,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Send',
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: const DecorationImage(
                                        image: ExactAssetImage(
                                          'assets/w1.png',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Emily',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: const DecorationImage(
                                        image: ExactAssetImage(
                                          'assets/m1.png',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Swan',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: const DecorationImage(
                                        image: ExactAssetImage(
                                          'assets/w2.jpg',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Mittali',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontWeight: FontWeight.normal),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'Transcations',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return TransactionCard(
                                      transaction: list[index]);
                                },
                              ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
