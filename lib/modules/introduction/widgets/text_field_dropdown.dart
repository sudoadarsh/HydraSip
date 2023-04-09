part of 'intro_page_widgets.dart';

class TextFieldDropdown<T> extends StatelessWidget {
  const TextFieldDropdown({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.items,
    required this.onChanged,
    this.dropdownValue,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final T? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
        if (dropdownValue == HeightMetrics.feet) ...[
          SizeC.spaceHorizontal5,
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: StringC.inches,
              ),
            ),
          ),
        ],
        SizeC.spaceHorizontal5,
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              items: items,
              onChanged: onChanged,
              value: dropdownValue,
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
