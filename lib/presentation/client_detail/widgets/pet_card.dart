// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pawsh_app/core/constants.dart';

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
      width: 320,
      height: 163,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // image
          Container(
            width: 110,
            decoration: BoxDecoration(
              color: Pallette.grey,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  image: NetworkImage(Constants.pet), fit: BoxFit.cover),
            ),
          ),

          16.wSizedBox,

          // data
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // naem
                Text(
                  data.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),

                // weight and breed
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${data.weight.toInt()} kg  '),
                    const Icon(
                      Icons.circle,
                      size: 3,
                    ),
                    Text(
                      ' ${data.breed}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),

                // description
                Flexible(
                  child: Text(
                    '"${data.description}"',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, color: Pallette.grey),
                  ),
                ),

                // tags
                Wrap(
                  clipBehavior: Clip.hardEdge,
                  spacing: 5,
                  runSpacing: 5,
                  children: data.tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Pallette.grey)),
                          child: Text(
                            tag,
                            style: const TextStyle(fontSize: 9),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
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
