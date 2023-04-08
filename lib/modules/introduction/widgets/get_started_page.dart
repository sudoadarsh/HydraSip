part of 'intro_page_widgets.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({
    Key? key,
    required this.onGetStarted,
  }) : super(key: key);

  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The App Name.
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: StringC.hydra,
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(
                      text: StringC.sip,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizeC.spaceVertical20,
              // Intro text.
              ASText(
                StringC.intro,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: onGetStarted,
            child: const Text(StringC.getStarted),
          ),
        ),
      ],
    );
  }
}
