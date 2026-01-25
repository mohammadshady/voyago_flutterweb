import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/core/functions/validator_function.dart';
import '../../../data/model/home/app-form-feild.dart';
import '../app_form_dialog.dart';

class ChangePasswordDialog extends GetView<HomeLayoutController> {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFormDialog(
      title: 'change_password',
      submitText: 'change_password',
      formKey: controller.formKey,
      fields: [
        AppFormField(
          label: 'current_password'.tr,
          controller: controller.currentPasswordController,
          hint: 'enter_the_current_password',
          validator: validator(controller.currentPasswordController.text, 'password', 100, 6)
        ),
        AppFormField(
          label: 'new_password'.tr,
          controller: controller.newPasswordController,
          hint: 'enter_the_new_password',
            validator: validator(controller.newPasswordController.text, 'password', 100, 6)

        ),
        AppFormField(
          label: 'confirm_new_password'.tr,
          controller: controller.newPasswordConfirmController,
          hint: 'enter_the_new_password_confirmation',
            validator: validator(controller.newPasswordConfirmController.text, 'password', 100, 6)

        ),
      ],
      onSubmit: (){  controller.changePassword(); },
    );
  }
}