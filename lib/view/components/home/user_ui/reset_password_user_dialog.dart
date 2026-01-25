import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/core/functions/validator_function.dart';

import '../../../../data/model/home/app-form-feild.dart';
import '../../app_form_dialog.dart';

class ResetPasswordDialog extends GetView<ManageUsersController> {
  const ResetPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFormDialog(
      title: 'change_password',
      submitText: 'change_password',
      formKey: controller.formKey,
      fields: [
        AppFormField(
            label: 'password',
            controller: controller.passwordController,
            hint: 'enter_password',
            validator: (value) => validator(controller.passwordController.text, 'password', 100, 6),
        ),
        AppFormField(
            label: 'password_confirmation',
            controller: controller.passwordConfirmationController,
            hint: 'enter_password_confirmation',
            validator:(value) => validator(controller.passwordConfirmationController.text, 'password', 100, 6)

        ),

      ],
      onSubmit: (){   },
    );
  }
}