import 'package:animex/features/media/presentation/home/anime_card.dart';
import 'package:animex/services/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageRow extends StatelessWidget {
  const HomePageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Continua a guardare", style: TextStyle(fontWeight: FontWeight.bold),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AnimeCard(onTap: () {
                  logger.d('message');
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
                AnimeCard(onTap: () {
                  context.go('/homepage/showcase');
                },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
