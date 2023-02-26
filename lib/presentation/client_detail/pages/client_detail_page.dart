// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawsh_app/core/extensions.dart';
import 'package:pawsh_app/core/pallete.dart';
import 'package:pawsh_app/core/utils/utils.dart';
import 'package:pawsh_app/domain/entities/user.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/appoinment_data_card.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/list_card.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/pet_card.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/reminder_tile.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/stats_card.dart';
import 'package:pawsh_app/presentation/client_detail/widgets/vert_text.dart';

import '../widgets/profile_header.dart';

const fakePetData = PetData(
  image: '',
  name: 'Axel',
  weight: 20,
  breed: 'Husky Siberia',
  description: '“Axel need treatment for nails and remove tick usin...”',
  tags: ['Tick Hair', 'White'],
);

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 44),
        child: ListView(
          children: [
            // header
            ProfileHeader(user: user),

            // appointment button
            const _AppointmentButton(),

            12.divider,

            // sales data
            const _SalesData(),

            12.divider,

            // Appointmets section
            const _AppointmentSection(),

            12.divider,

            // Pets Section
            const _PetsSection(),

            12.divider,

            // Reminder Preferances
            const _ReminderSection(),
          ],
        ),
      ),
    );
  }
}

class _AppointmentButton extends StatelessWidget {
  const _AppointmentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Create an appointment',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, padding: const EdgeInsets.all(10)),
        onPressed: () {
          // pick date
          pickDate(context);
        },
      ),
    );
  }
}

class _SalesData extends StatelessWidget {
  const _SalesData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // total
            const VertText(
              title: r'$1200',
              subtitle: 'Total Sales',
              titleStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),

            13.hSizedBox,

            // stats
            Row(
              children: [
                const VertText(title: '50', subtitle: 'Total Bookings'),
                20.wSizedBox,
                const VertText(title: '51', subtitle: 'Completed'),
                20.wSizedBox,
                const VertText(title: '2', subtitle: 'Cancelled'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AppointmentSection extends StatelessWidget {
  const _AppointmentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        // height: 358,
        child: ListCard(
          title: 'Appointments',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // stats cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  StatsCard(selected: true, title: '1', subtitle: 'Upcomming'),
                  StatsCard(title: '24', subtitle: 'Finished'),
                  StatsCard(title: '2', subtitle: 'Canceled'),
                ],
              ),

              16.hSizedBox,

              // data card
              AppoinmentDataCard(data: AppoinmentData()),
            ],
          ),
        ),
      ),
    );
  }
}

class _PetsSection extends StatelessWidget {
  const _PetsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListCard(
        title: 'Pets',
        child: Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => const PetCard(data: fakePetData),
            separatorBuilder: (context, index) => 10.wSizedBox,
          ),
        ),
      ),
    );
  }
}

class _ReminderSection extends StatelessWidget {
  const _ReminderSection({
    Key? key,
  }) : super(key: key);
  final items = const [
    ReminderTile(label: '15 days before', iconData: CupertinoIcons.clock),
    ReminderTile(
        label: 'Via Email, Notification', iconData: CupertinoIcons.paperplane),
    ReminderTile(
      label:
          'For my additional note want to subscribe groomer service if fast handling ',
      labelColor: Pallette.grey,
      iconData: Icons.copy_all_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListCard(
        title: 'Reminder Preferences',
        child: Column(children: items),
      ),
    );
  }
}
