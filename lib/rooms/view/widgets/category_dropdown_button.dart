import 'package:chat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class CategoryDropDownButton extends StatefulWidget {
  final void Function(String?) onRoomSelected;
  CategoryDropDownButton({super.key, required this.onRoomSelected});

  @override
  State<CategoryDropDownButton> createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
   String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final bodySmallStyle = Theme.of(context).textTheme.bodySmall;
    return DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          value: selectedCategory,
      isExpanded: true,
      hint: Text(
        'Select Room Category',
        style: bodySmallStyle?.copyWith(color: AppTheme.greycolor),
      ),
      items: ['Sports', 'Music', 'Movies']
          .map((category) => DropdownMenuItem(
              value: category,
              child: Text(
                category,
                style: bodySmallStyle?.copyWith(
                  fontSize: 18
                ),
              )))
          .toList(),
      onChanged: (category) => setState(
        () {
          selectedCategory=category;
          widget.onRoomSelected(selectedCategory);

        },
      ),
          validator: (value) {
            if(value == null)
              {
                return 'Must Choose Room';
              }
            return null;
          },
    ));
  }
}
