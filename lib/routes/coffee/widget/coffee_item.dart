import 'package:algoriza_task/model/Coffee.dart';
import 'package:algoriza_task/widgets/app_image.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  const CoffeeItem({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 12,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppImage(imageUrl: coffee.image!),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.title ?? '',
                      style: theme.textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      coffee.description ?? '',
                      style: theme.textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
