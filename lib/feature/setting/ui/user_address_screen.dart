import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/Router/routes.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/feature/setting/widgets/user_addrees_widgets/e_custom_single_address.dart';


class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoute.addNewAddressScreen),
        child: const Icon(Icons.add),
      ),
      appBar: EAppBar(
        showBackArrowButton: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(ELocalSize.defaultSpace),
              child: Column(
                children: [
                  ECustomSingleAddress(
                    selectedAddress: false,
                  ),
                  ECustomSingleAddress(
                    selectedAddress: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


