import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Esse sit esse proident et ullamco in aliqua excepteur proident sint adipisicing sint veniam cupidatat. Exercitation elit ad et proident mollit esse amet id id irure incididunt. Nisi fugiat dolor consectetur deserunt ex ad deserunt anim magna. Laborum commodo ullamco sunt occaecat. Incididunt qui nisi ad deserunt nisi commodo. Aliqua aliquip et nostrud ullamco in aliqua dolore Lorem laborum dolore quis excepteur aute. Veniam eu id laboris incididunt ut minim incididunt quis.',
      'assets/Images/1.png'),
  SlideInfo(
      'Entrega rapido',
      'Ad excepteur labore ipsum ullamco cillum et. Ullamco minim ipsum dolore qui pariatur est dolor. Amet amet ea aliquip ullamco labore cupidatat fugiat voluptate laboris in magna. Enim ut et consequat nisi eu consectetur ipsum irure labore incididunt pariatur. Voluptate aute ad commodo ipsum veniam aliquip proident aute qui est.',
      'assets/Images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ex aliqua incididunt do incididunt elit. Sit officia incididunt nulla dolor velit laboris fugiat voluptate fugiat enim adipisicing. Ipsum dolor pariatur pariatur est exercitation consectetur tempor culpa minim fugiat pariatur adipisicing. In laboris enim exercitation pariatur exercitation eu do dolor ea id. Do pariatur do sit officia tempor sunt veniam occaecat magna. Et consequat elit deserunt eiusmod velit proident eu in exercitation sint sunt laborum. Dolor ipsum anim deserunt reprehenderit commodo consequat voluptate.',
      'assets/Images/3.png'),
];

class TutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController pageViewController = PageController();
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slidedata) => _Slide(
                      title: slidedata.title,
                      caption: slidedata.caption,
                      imageUrl: slidedata.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Salir'),
                      onPressed: () => context.pop(),
                    ),
                  ))
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
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

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
          Image(
            image: AssetImage(imageUrl),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      )),
    );
  }
}
