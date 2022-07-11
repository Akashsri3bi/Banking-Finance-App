import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:syndicate/model.dart/transaction.dart';
import 'package:syndicate/repository/customer_database.dart';

import '../model.dart/customer.dart';

class CustomerCard extends StatefulWidget {
  final Customer customer;

  const CustomerCard({Key? key, required this.customer}) : super(key: key);

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Pay Now',
                  style: Theme.of(context).textTheme.headline2,
                ),
                content: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: TextField(
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Amount",
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).primaryColor,
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 5.0, top: 12.5),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white))),
                        style: const TextStyle(
                          fontSize: 23,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          CustomerDatabase.instance.insertTransaction(
                              TransactionList(
                                  name: widget.customer.name,
                                  url: widget.customer.url,
                                  value: controller.text));
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Transfer',
                          style: Theme.of(context).textTheme.headline2,
                        ))
                  ],
                ),
              );
            });
      },
      child: Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: ExactAssetImage(widget.customer.url),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.customer.name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.customer.phoneNo.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
