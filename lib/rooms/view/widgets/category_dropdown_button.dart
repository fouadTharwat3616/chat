import 'package:chat/rooms/data/models/category_model.dart';
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
      items: CategoryModel.categories
          .map((category) => DropdownMenuItem(
              value: category.id,
              child: Row(
                children: [
                  Image.asset('assets/images/${category.imageName}.png',height: 24,),
                  const SizedBox(width: 8,),
                  Text(
                    category.name,
                    style: bodySmallStyle?.copyWith(
                      fontSize: 18
                    ),
                  ),
                ],
              )))
          .toList(),
      onChanged: (categoryId) => setState(
        () {
          selectedCategory=categoryId;
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
