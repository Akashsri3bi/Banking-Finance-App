import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syndicate/repository/customer_database.dart';

import '../model.dart/customer.dart';
import '../widgets/customer_card.dart';

class CustomerScreen extends StatefulWidget {
  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  TextEditingController controller = TextEditingController();

  late List<Customer> customers;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() {
      isLoading = true;
    });
    customers = await CustomerDatabase.instance.readAllData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  'assets/ecommerce_logo.png',
                  color: Colors.black,
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
                    .copyWith(color: Colors.black, fontSize: 18),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  onChanged: onSearchTextChanged,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter Name",
                      suffixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 20.0, bottom: 5.0, top: 12.5),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white))),
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
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
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          return CustomerCard(customer: customers[index]);
                        })),
          ],
        ));
  }
}

onSearchTextChanged(String text) async {
  //Future needs for the app
}
