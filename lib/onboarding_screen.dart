import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_screen/onboarding_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idxRiverpod = ref.watch(indexProvider);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              ref.read(indexProvider.notifier).update((state) => value);
            },
            itemCount: images.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: NetworkImage(
                      images[index],
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 114,
            right: 114,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  spacing: 8,
                  children: List.generate(
                    images.length,
                    (index) => Container(
                        width: 45,
                        height: 5,
                        color:
                            idxRiverpod == index ? Colors.white : Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
