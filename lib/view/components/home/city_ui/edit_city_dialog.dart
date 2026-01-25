import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/manage_citites_controller.dart';
import 'package:web_project2/core/classes/handling-data-request.dart';
import 'package:web_project2/core/functions/validator_function.dart';

import '../../../../data/model/home/app-form-feild.dart';
import '../../app_form_dialog.dart';

class EditCityDialog extends StatelessWidget {
  final int index;
  const EditCityDialog(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageCitiesController>(builder: (controller){
      return HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget:  AppFormDialog(
            title: 'edit_city',
            submitText: 'save_changes',
            formKey: controller.formKey,
            showActiveCheckbox: true,
            isActive: controller.isActive,
            onActiveChanged: (val) {
              controller.changeActive(val);
            },
            fields: [
              AppFormField(
                  label: 'name',
                  controller: controller.nameController,
                  hint: 'enter_name',
                  validator: (value) => validator(controller.nameController.text, 'name', 100, 3)
              ),
              AppFormField(
                  label: 'english_name',
                  controller: controller.englishNameController,
                  hint: 'enter_english_name',
                  validator: (value) => validator(controller.englishNameController.text, 'name', 100, 3)

              ),
            ],
            onSubmit: (){  controller.editCity(); },
          ),
      );
    });
  }
}