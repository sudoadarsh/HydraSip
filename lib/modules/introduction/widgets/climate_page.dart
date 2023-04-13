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
              SizeC.spaceVertical20,
              Column(
                children: Climate.values.map((e) {
                  String title;
                  switch (e) {
                    case Climate.temperate:
                      title = StringC.temperate;
                      break;
                    case Climate.hotAndDry:
                      title = StringC.hotAndDry;
                      break;
                    case Climate.hotAndHumid:
                      title = StringC.hotAndHumid;
                      break;
                    case Climate.cold:
                      title = StringC.cold;
                      break;
                  }
                  return RadioListTile(
                    value: e,
                    title: ASText(title),
                    groupValue: bloc.climate,
                    onChanged: (value) =>
                        bloc.add(ToggleMetricsEvent<Climate>(metric: value)),
                  );
                }).toList(),
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
            onPressed: onClimateContinue,
            child: const ASText(StringC.cont),
          ),
        ),
      ],
    );
  }
}
