import 'package:flutter/material.dart';
import 'package:syndicate/model.dart/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionList transaction;

  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        height: 82,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: ExactAssetImage(transaction.url),
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
                    transaction.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('h:mm a d MMM y').format(DateTime.now()),
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.grey.withOpacity(0.9)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  transaction.value,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Sent from KBank',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey.withOpacity(0.9)),
                )
              ],
            )
          ],
        ));
  }
}
