part of '../initial_screen.dart';

const _secondaryColor = const Color(0xff01b4e4);
const _tertiaryColor = const Color(0xff90cea1);

const _secondaryOpacity = 0.5;

const _imageTmdbLogo = 'assets/images/primary-long-blue.png';

class _Logo extends StatelessWidget {
  const _Logo({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30.0),
              Icon(
                Icons.movie_filter_outlined,
                color: _secondaryColor.withOpacity(_secondaryOpacity),
                size: 90.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Cinemascope',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _secondaryColor,
                  fontSize: 36.0,
                  letterSpacing: 4.0,
                  shadows: <Shadow>[
                    const Shadow(
                      offset: const Offset(2.0, 2.0),
                      color: _tertiaryColor,
                      blurRadius: 20.0,
                    ),
                    const Shadow(
                      offset: const Offset(1.0, 1.0),
                      color: _tertiaryColor,
                      blurRadius: 60.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60.0),
              child,
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
            child: Align(
              alignment: const Alignment(1.0, 1.0),
              child: const _PoweredBy(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PoweredBy extends StatelessWidget {
  const _PoweredBy();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _secondaryOpacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: const Text(
              'Powered by',
              style: TextStyle(
                color: _tertiaryColor,
                fontSize: 16.0,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w300,
                shadows: <Shadow>[
                  const Shadow(
                    offset: const Offset(1.0, 1.0),
                    color: _secondaryColor,
                    blurRadius: 8.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Image.asset(
            _imageTmdbLogo,
            width: MediaQuery.of(context).size.width / 2.0,
          ),
        ],
      ),
    );
  }
}
