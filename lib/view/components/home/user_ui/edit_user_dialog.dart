import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/core/functions/validator_function.dart';

import '../../../../data/model/home/app-form-feild.dart';
import '../../app_form_dialog.dart';

class EdiUserDialog extends GetView<ManageUsersController> {
  final int index;
  const EdiUserDialog(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageUsersController>(builder: (controller){
      return AppFormDialog(
        title: 'edit_user',
        submitText: 'save_changes',
        formKey: controller.formKey,
        showActiveCheckbox: true,
        isActive: controller.isActive,
        onActiveChanged: (val) {
          controller.changeActive(index);
        },
        fields: [
          AppFormField(
              label: 'full_name',
              controller: controller.fullNameController,
              hint: 'enter_full_name',
              validator:(value) => validator(controller.fullNameController.text, 'username', 100, 6)
          ),
          AppFormField(
              label: 'email',
              controller: controller.emailController,
              hint: 'enter_email',
              validator: (value) =>validator(controller.emailController.text, 'email', 100, 6)

          ),
          AppFormField(
              label: 'mobile',
              controller: controller.mobileController,
              hint: 'enter_mobile',
              validator:(value) => validator(controller.mobileController.text, 'phone', 13, 10)

          ),

        ],
        onSubmit: (){   },
      );
    });
  }
}