part of 'intro_page_widgets.dart';

class HwPage extends StatelessWidget {
  const HwPage({
    Key? key,
    required this.weightController,
    required this.heightController,
    required this.bloc,
    required this.onHWContinue,
    required this.inchController,
    required this.proceed,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController weightController;
  final TextEditingController heightController;
  final TextEditingController inchController;
  final IntroductionBloc bloc;
  final VoidCallback onHWContinue;
  final bool proceed;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            onChanged: () {
              List<TextEditingController> controllers = [
                weightController,
                heightController
              ];
              if (bloc.heightMetric == HeightMetrics.feet) {
                controllers.add(inchController);
              }
              bloc.add(ValidateFormEvent(controllers: controllers));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                        offset: const Offset(0, 3), child: IconC.hint),
                    SizeC.spaceHorizontal10,
                    Expanded(
                      child: ASText(
                        StringC.requestHW,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // The height input field.
                ASText(
                  StringC.height,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextFieldDropdown<HeightMetrics>(
                  hintText: bloc.heightMetric.name,
                  controller: heightController,
                  dropdownValue: bloc.heightMetric,
                  inchController: inchController,
                  items: HeightMetrics.values
                      .map((e) => DropdownMenuItem<HeightMetrics>(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: (metric) => bloc
                      .add(ToggleMetricsEvent<HeightMetrics>(metric: metric)),
                ),
                SizeC.spaceVertical20,

                // The weight input field.
                ASText(
                  StringC.weight,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextFieldDropdown<WeightMetrics>(
                  hintText: bloc.weightMetrics.name,
                  controller: weightController,
                  dropdownValue: bloc.weightMetrics,
                  items: WeightMetrics.values
                      .map((e) => DropdownMenuItem<WeightMetrics>(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                  onChanged: (metric) => bloc
                      .add(ToggleMetricsEvent<WeightMetrics>(metric: metric)),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: proceed ? onHWContinue : null,
            child: const ASText(StringC.cont),
          ),
        ),
      ],
    );
  }
}
