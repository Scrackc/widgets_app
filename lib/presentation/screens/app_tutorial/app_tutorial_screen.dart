import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final List<SlideInfo> slides = [
  SlideInfo(
      'Busca comida',
      'Qui do sit minim culpa consectetur cupidatat pariatur laborum amet consectetur nisi ipsum elit. Officia amet dolor ea enim. Sint incididunt laborum mollit aliquip culpa adipisicing. Sunt aliqua qui proident exercitation eu mollit ex qui amet. Irure est irure ipsum reprehenderit laboris proident culpa ex adipisicing magna eu magna exercitation aliqua.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Occaecat sint ut tempor tempor velit elit officia minim nisi mollit culpa sit. Fugiat excepteur quis duis voluptate consequat exercitation adipisicing. Proident magna aliquip ex eu anim incididunt consectetur. Dolor velit ea duis consequat veniam magna. Ullamco esse commodo qui cillum culpa Lorem enim irure consectetur. Dolor tempor eiusmod incididunt tempor Lorem fugiat fugiat. Ut eiusmod proident commodo exercitation id Lorem do id laboris.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Lorem dolore amet dolore aliqua. Culpa officia in veniam est officia laboris elit voluptate. Eiusmod deserunt laborum laboris aliquip. Aliqua ad nostrud eiusmod tempor irure veniam duis commodo consectetur.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
