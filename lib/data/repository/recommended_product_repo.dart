import 'package:get/get.dart';
import 'package:shop_ban_hang/data/api/api_client.dart';
import 'package:shop_ban_hang/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI); 
  }
}