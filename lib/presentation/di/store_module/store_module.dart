import 'package:ease_my_deal_assignment/di/service_locator.dart';
import 'package:ease_my_deal_assignment/domain/usecase/product/get_product_usecase.dart';
import 'package:ease_my_deal_assignment/presentation/view_modal/product_bloc/product_bloc.dart';

mixin StoreModule {
  static Future<void> configureProductStoreModuleInjection() async {
    // Registering the ProductBloc with its dependency
    getIt.registerSingleton<ProductBloc>(
      ProductBloc(
        getProductUsecase: getIt<GetProductUsecase>(),
       
      ),
    );
  }
}
