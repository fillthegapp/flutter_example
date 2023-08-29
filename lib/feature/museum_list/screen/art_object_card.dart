import 'package:flutter/material.dart';

class ArtObjectCard extends StatelessWidget {
  final String title;
  final String author;
  final String image;
  final VoidCallback onClicked;

  const ArtObjectCard({
    super.key,
    required this.onClicked,
    required this.title,
    required this.author,
    required this.image,
  });

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () => onClicked(),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Image(image: image),
            _Information(title: title, author: author)
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String image;

  const _Image({required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      width: 120.0,
      child: Image.network(
        image,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _Information extends StatelessWidget {
  final String title;
  final String author;

  const _Information({
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox.square(dimension: 4.0),
            Text(author, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
