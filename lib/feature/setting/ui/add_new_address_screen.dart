import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/themes/e_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/utils/device/e_local_size.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/widgets/custom_button_local.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBar(
        showBackArrowButton: true,
        title: Text(
          "Add New Address",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ELocalSize.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: ELocalSize.spaceBtweenInputFildes,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: ELocalSize.spaceBtweenInputFildes,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      height: ELocalSize.spaceBtweenInputFildes,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Post Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: ELocalSize.spaceBtweenInputFildes,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.buliding),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      height: ELocalSize.spaceBtweenInputFildes,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'Satet'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: ELocalSize.spaceBtweenInputFildes,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: ELocalSize.defaultSpace,
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButtonLocal(
                      color: ColorsManger.blue,
                      height: 45.h,
                      isBorder: false,
                      onTap: () {},
                      text: 'Save',
                      width: 320.w,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
