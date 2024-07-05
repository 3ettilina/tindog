import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  const DogCard({
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.gender,
    required this.isNeutered,
    required this.interests,
    super.key,
  });

  final String imageUrl;
  final String name;
  final String age;
  final String gender;
  final bool isNeutered;
  final List<String> interests;

  @override
  Widget build(BuildContext context) {
    final neuteredInfo = isNeutered ? 'Neutered' : 'Not neutered';
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Expanded(flex: 7, child: _DogAvatar(imageUrl)),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Column(
                children: [
                  _DogName(name),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                'Interests:',
                                style: context.textTheme.labelMedium,
                              ),
                              _Interests(interests),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(age, style: context.textTheme.bodySmall),
                            Text(gender, style: context.textTheme.bodySmall),
                            Text(
                              neuteredInfo,
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DogAvatar extends StatelessWidget {
  const _DogAvatar(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: Image.network(url).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _DogName extends StatelessWidget {
  const _DogName(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _Interests extends StatelessWidget {
  const _Interests(this.interests);

  final List<String> interests;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: interests
          .map(
            (i) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                child: Text(
                  i,
                  style: context.textTheme.labelSmall,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
