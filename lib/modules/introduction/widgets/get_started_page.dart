part of 'intro_page_widgets.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  // Primary color container.
                  ASText(StringC.intro, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(StringC.getStarted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
