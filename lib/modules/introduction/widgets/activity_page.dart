part of 'intro_page_widgets.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({
    Key? key,
    required this.bloc,
    required this.onActivityContinue,
  }) : super(key: key);

  final IntroductionBloc bloc;
  final VoidCallback onActivityContinue;

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
                      StringC.requestActivity,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              SizeC.spaceVertical20,
              ...Activity.values.map((e) {
                String title;
                switch (e) {
                  case Activity.sedentary:
                    title = StringC.sedentary;
                    break;
                  case Activity.lightly:
                    title = StringC.lightlyActive;
                    break;
                  case Activity.moderately:
                    title = StringC.moderatelyActive;
                    break;
                  case Activity.very:
                    title = StringC.veryActive;
                    break;
                  case Activity.extremely:
                    title = StringC.extremeActive;
                    break;
                }
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Radio(
                    visualDensity: VisualDensity.compact,
                    value: e,
                    groupValue: bloc.activity,
                    onChanged: (val) => bloc.add(ToggleMetricsEvent<Activity>(metric: e)),
                  ),
                  title: ASText(title),
                );
              }).toList()
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: () {},
            child: const ASText(StringC.cont),
          ),
        ),
      ],
    );
  }
}
