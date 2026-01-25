import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/home/app-form-feild.dart';

class AppFormDialog extends StatelessWidget {
  final String title;
  final List<AppFormField> fields;
  final GlobalKey<FormState> formKey;

  final bool showActiveCheckbox;
  final bool isActive;
  final ValueChanged<bool>? onActiveChanged;

  final String submitText;
  final VoidCallback onSubmit;

  const AppFormDialog({
    super.key,
    required this.title,
    required this.fields,
    required this.formKey,
    required this.onSubmit,
    this.submitText = 'Add',
    this.showActiveCheckbox = false,
    this.isActive = true, this.onActiveChanged,
  });

  static const double _labelWidth = 150;
  static const double _fieldSpacing = 120;
  static const double _contentPadding = 20;

  double get _fieldStart =>
      _contentPadding + _labelWidth + _fieldSpacing;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 800,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _contentPadding,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title.tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const SizedBox(height: 20),
              ...fields.map((field) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _contentPadding,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: _labelWidth, // ⬅ make this big enough
                          child: Text(
                            field.label.tr,
                            softWrap: false,     // ✅ never wrap
                            overflow: TextOverflow.visible, // ✅ no ellipsis
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: _fieldSpacing),
                        Expanded(
                          child: TextFormField(
                            controller: field.controller,
                            decoration: InputDecoration(
                              hintText: field.hint.tr,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,   // ⬅ controls height
                                horizontal: 12,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero, // optional
                                borderSide: BorderSide(color: Colors.grey.shade400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: Colors.grey.shade400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: Colors.grey.shade600),
                              ),
                            ),
                            validator: field.validator,
                          ),

                        ),
                      ],
                    ),
                  ),
                );
              }),
              if (showActiveCheckbox)
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: _fieldStart, // same start as TextField
                    end: _contentPadding,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Remove internal checkbox padding
                      Transform.translate(
                        offset: const Offset(-4, 0), // shift left to align perfectly
                        child: Checkbox(
                          value: isActive,
                          onChanged: (val) =>
                              onActiveChanged?.call(val ?? true),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'active'.tr,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: _fieldStart,
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35, // ⬅ button height
                      child: ElevatedButton(
                        onPressed: onSubmit,
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // ⬅ no radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        child: Text(submitText.tr),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 35,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(0, 4), // ⬅ bottom shadow only
                            ),
                          ],
                        ),
                        child: OutlinedButton(
                          onPressed: () => Get.back(),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                          ),
                          child: Text(
                            'cancel'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
