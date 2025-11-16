import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_study/ui/theme/models/app_images.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.loader),
            const Text("Ищем подходящие автомобили"),
          ],
        ),
      ),
    );
  }
}
