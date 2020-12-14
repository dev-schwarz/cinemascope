part of '../initial_screen.dart';

class _Splash extends StatefulWidget {
  const _Splash();

  @override
  __SplashState createState() => __SplashState();
}

class __SplashState extends State<_Splash> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();

    _disposers = [
      when((_) => context.dataStore.isInitialized, () => _controller.reverse()),
    ];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _fadeAnimationDuration),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.dataStore.fetchAllData();
        } else if (status == AnimationStatus.dismissed) {
          Navigator.of(context).popAndPushNamed(AppRoutes.HOME);
        }
      });

    Future.delayed(const Duration(milliseconds: _startAnimationDelay)).whenComplete(() {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Opacity(
        opacity: Tween<double>(begin: 0.0, end: 1.0).evaluate(_controller),
        child: _Logo(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: context.theme.textTheme.subtitle2,
              ),
              const SizedBox(height: 10.0),
              Text(
                context.userStore.user.name,
                style: context.theme.textTheme.subtitle1,
              ),
              const SizedBox(height: 20.0),
              Opacity(
                opacity: _secondaryOpacity,
                child: ColorLoaderIndicator(
                  radius: 30.0,
                  dotRadius: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    _controller
      ..removeListener(() {})
      ..removeStatusListener((status) {})
      ..dispose();
    super.dispose();
  }

  static const _startAnimationDelay = 1500;
  static const _fadeAnimationDuration = 1000;
}
