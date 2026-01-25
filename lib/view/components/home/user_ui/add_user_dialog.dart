import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/home_layout_controller.dart';
import 'package:web_project2/controller/home/manage_users_controller.dart';
import 'package:web_project2/core/functions/validator_function.dart';

import '../../../../data/model/home/app-form-feild.dart';
import '../../app_form_dialog.dart';

class AddUserDialog extends GetView<ManageUsersController> {
  const AddUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFormDialog(
      title: 'add_new',
      submitText: 'add',
      formKey: controller.formKey,
      showActiveCheckbox: true,
      onActiveChanged: (val) {
        //controller.changeActive(val);
      },
      fields: [
        AppFormField(
          label: 'full_name',
          controller: controller.fullNameController,
          hint: 'enter_full_name',
          validator: (value) => validator(controller.fullNameController.text, 'username', 100, 6)
        ),
        AppFormField(
          label: 'email',
          controller: controller.emailController,
          hint: 'enter_email',
            validator: (value) => validator(controller.emailController.text, 'email', 100, 6)

        ),
        AppFormField(
          label: 'password',
          controller: controller.passwordController,
          hint: 'enter_password',
            validator: (value) => validator(controller.passwordController.text, 'password', 100, 6)

        ),
        AppFormField(
            label: 'mobile',
            controller: controller.mobileController,
            hint: 'enter_mobile',
            validator: (value) => validator(controller.mobileController.text, 'phone', 13, 10)

        ),
      ],
      onSubmit: (){  },
    );
  }
}