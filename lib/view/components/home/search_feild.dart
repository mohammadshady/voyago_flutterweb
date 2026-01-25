import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onPressed;

  const SearchField({super.key, required this.controller, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 500,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '${'search'.tr}...',
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 12),
                border: _border(),
                enabledBorder: _border(),
                focusedBorder: _border(color: Colors.blue),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 44,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child:  IconButton(onPressed: onPressed, icon: const Icon(Icons.search,color: Colors.white,size: 20,)),

          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4),
        bottomLeft: Radius.circular(4),
      ),
      borderSide: BorderSide(color: color.withOpacity(0.4)),
    );
  }
}
