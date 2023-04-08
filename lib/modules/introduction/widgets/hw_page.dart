part of 'intro_page_widgets.dart';

class HwPage extends StatelessWidget {
  const HwPage({
    Key? key,
    required this.weightController,
    required this.heightController,
  }) : super(key: key);

  final TextEditingController weightController;
  final TextEditingController heightController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                      offset: const Offset(0, 3),
                      child: IconC.hint
                  ),
                  SizeC.spaceHorizontal10,
                  Expanded(
                    child: ASText(
                      StringC.requestHW,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              SizeC.spaceVertical20,
              SizeC.spaceVertical20,
              ASText(StringC.height,
                  style: Theme.of(context).textTheme.bodySmall),
              TextField(
                controller: heightController,
                decoration:
                    const InputDecoration(hintText: StringC.enterAValue),
              ),
              SizeC.spaceVertical20,
              ASText(StringC.weight,
                  style: Theme.of(context).textTheme.bodySmall),
              TextField(
                controller: weightController,
                decoration:
                    const InputDecoration(hintText: StringC.enterAValue),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(StringC.cont),
          ),
        ),
      ],
    );
  }
}
