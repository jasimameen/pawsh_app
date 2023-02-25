// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pawsh_app/core/extensions.dart';
import 'package:pawsh_app/core/pallete.dart';
import 'package:pawsh_app/presentation/widgets/dash_card.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PetData data;

  @override
  Widget build(BuildContext context) {
    return DashCard(
      width: 295,
      height: 163,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // image
          Container(
            width: 86,
            decoration: BoxDecoration(
                color: Pallette.grey, borderRadius: BorderRadius.circular(12)
                // image: DecorationImage(image: AssetImage('assetName'))
                ),
          ),

          16.wSizedBox,

          // data
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // naem
              Text(data.name),

              // weight and breed
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${data.weight} kg  '),
                  const Icon(
                    Icons.circle,
                    size: 3,
                  ),
                  Text(' ${data.breed}')
                ],
              ),

              // description
              Text(
                '"${data.description}"',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: Pallette.grey),
              ),

              // tags
              Wrap(
                clipBehavior: Clip.hardEdge,
                spacing: 5,
                runSpacing: 5,
                children:
                    data.tags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PetData {
  final String image;
  final String name;
  final double weight;
  final String breed;
  final String description;
  final List<String> tags;

  const PetData({
    required this.image,
    required this.name,
    required this.weight,
    required this.breed,
    required this.description,
    required this.tags,
  });
}
