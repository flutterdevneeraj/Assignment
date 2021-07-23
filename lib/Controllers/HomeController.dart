import 'package:get/get.dart';

class HomeController extends GetxController {
  // selected index for bottom navigation
  var selectedIndex = 0.obs;
  // varibles for home screen
  var currentPage = 0.obs;
  var closeBtSelected = false.obs;
  var messageBtSelected = false.obs;
  var likeBtSelected = false.obs;
  @override
  void onInit() {
    closeBtSelected.value = true;
    super.onInit();
  }
  // This function is used to change bottom navigation index value
  changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
  // This function is used to selected bottom bottons
  bottonSelection(int currentBotton){
    switch(currentBotton){
      case 1:
        closeBtSelected.value = !closeBtSelected.value;
        messageBtSelected(false);
        likeBtSelected(false);
        currentPage.value = 0;
        break;
      case 2:
        messageBtSelected.value = !messageBtSelected.value;
        closeBtSelected(false);
        likeBtSelected(false);
        currentPage.value = 1;
        break;
      case 3:
        likeBtSelected.value = !likeBtSelected.value;
        closeBtSelected(false);
        messageBtSelected(false);
        currentPage.value = 2;
        break;
    }
  }
}
