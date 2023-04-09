part of 'intro_page_widgets.dart';

class ClimatePage extends StatelessWidget {
  const ClimatePage({
    Key? key,
    required this.bloc,
    required this.onClimateBack,
    required this.onClimateContinue,
  }) : super(key: key);

  final IntroductionBloc bloc;
  final VoidCallback onClimateBack;
  final VoidCallback onClimateContinue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                      offset: const Offset(0, 3), child: IconC.hint),
                  SizeC.spaceHorizontal10,
                  Expanded(
                    child: ASText(
                      StringC.requestClimate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: OutlinedButton(
            onPressed: onClimateBack,
            child: const ASText(StringC.back),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: ElevatedButton(
            onPressed: () async {
              PermissionStatus status =
                  await OpenWeatherUtil.requestPermission();
              if (!status.isGranted) {
                // ignore: use_build_context_synchronously
                _confirm(context);
                return;
              }
              onClimateContinue();
            },
            child: const ASText(StringC.cont),
          ),
        ),
      ],
    );
  }

  /// Dialog to confirm the user selection.
  void _confirm(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const ASText(StringC.appName),
          content: const Text(StringC.confirmLocation),
          actions: [
            TextButton(
              onPressed: () async {
                PermissionStatus status =
                    await OpenWeatherUtil.requestPermission();
                if (status.isGranted) {
                  // Move to Next page.
                  onClimateContinue();
                } else if (status.isPermanentlyDenied) {
                  AppSettings.openLocationSettings();
                }
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const ASText(StringC.grant),
            ),
            ElevatedButton(onPressed: () {}, child: const Text(StringC.cont)),
          ],
        );
      },
    );
  }
}
