import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_project2/controller/home/paginate_controller.dart';
import 'package:web_project2/data/source/remote/home/user-data.dart';
import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data.dart';
import '../../data/model/home/user.dart';
import '../../view/components/home/user_ui/add_user_dialog.dart';
import '../../view/components/home/user_ui/edit_user_dialog.dart';
import '../../view/components/home/user_ui/reset_password_user_dialog.dart';


class ManageUsersController extends PaginationController<UserModel> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();
  bool isActive = true;



  StatusRequest statusRequest = StatusRequest.none;
  UserData userData = UserData(Get.find());

  List<UserModel> users = [];


  changeActive(value){
    isActive = value;
    update();
  }


  void openAddDialog() {
    _clearForm();
    Get.dialog(const AddUserDialog());
  }

  void openEditDialog(int index) {
    fullNameController.text = users[index].englishName!;
    emailController.text = users[index].email!;
    mobileController.text = users[index].mobile!;

    Get.dialog( EdiUserDialog(index));
  }

  void openResetPasswordDialog() {
    _clearForm();
    Get.dialog(const ResetPasswordDialog());
  }

  void _clearForm() {
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    mobileController.clear();
  }

  @override
  Future<void> fetchPage([int page = 1]) async {
    users.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.getUsers(page,searchController.text);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.success){
      if(response['status'] == 'success') {
        List userData = response['data'];
        users.addAll(userData.map((e) => UserModel.fromJson(e)));
        final meta = response['meta'];
        currentPage = meta['current_page'];
        lastPage = meta['last_page'];
        perPage = meta['per_page'];
        total = meta['total'] ;
      }else if(response['status'] == 'failure'){
        total = 0;
      }
    }
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    emailController.dispose();
    fullNameController.dispose();
    mobileController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    fetchPage();
    super.onInit();
  }



}
