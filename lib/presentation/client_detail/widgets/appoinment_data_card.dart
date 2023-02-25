// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsh_app/core/pallete.dart';
import 'package:pawsh_app/presentation/widgets/dash_card.dart';

class AppoinmentDataCard extends StatelessWidget {
  const AppoinmentDataCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final AppoinmentData data;

  @override
  Widget build(BuildContext context) {
    return DashCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          // date time
          ListTile(
            // date
            title: Text(
              'Mon, 3 Nov 2021',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),

            // time
            subtitle:
                Text('Time: 9:30 - 11:30 am', style: TextStyle(fontSize: 12)),

            // amount
            trailing: Text(
              r'$140',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Pallette.pink,
              ),
            ),
          ),

          Divider(height: 15),

          // address
          ListTile(
            title: Text(
              'Dianne Russell',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'San Fransico, CA (12.3 miles away)',
              style: TextStyle(color: Pallette.grey),
            ),
          ),

          // sevice Type
          ListTile(
            leading: Icon(CupertinoIcons.car_detailed),
            title: Text(
              'Mobile Service',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      ),
    );
  }
}

class AppoinmentData {}
