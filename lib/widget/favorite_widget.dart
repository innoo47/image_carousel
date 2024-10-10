import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isFavorite = false;
  bool isSaved = false;
  int favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (favoriteCount >= 0) {
                    isFavorite = !isFavorite;
                    isFavorite ? favoriteCount++ : favoriteCount--;
                  } else {
                    favoriteCount = 0;
                  }
                });
              },
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              favoriteCount.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.chat_bubble_outline_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.share_outlined),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSaved = !isSaved;
                });
              },
              child: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
            ),
          ),
        ],
      ),
    );
  }
}
