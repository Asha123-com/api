import 'package:api/model/wp%20model.dart';
import 'package:api/services/wp%20services.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  bool isLoading = false;
  Map<String, List<Wpmodel>> wallpapers = {};

  vmGetwallpaperData(String category) async {
    isLoading = true;
    update();
    wallpapers[category] = await Wpservices().fetchWpData(category);
    isLoading =false;
    update();
  }

  List<Wpmodel> vmWallpapers(String category) {
    return wallpapers[category] ?? [];
  }
}
