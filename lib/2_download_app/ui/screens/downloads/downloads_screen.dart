import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w4_download_app/2_download_app/ui/theme/theme.dart';
import '../../providers/theme_color_provider.dart';
import 'widgets/download_controler.dart';


class DownloadsScreen extends StatelessWidget {
  // Create the list of fake ressources
  final List<Ressource> ressources = [
    Ressource(name: "image1.png", size: 120),
    Ressource(name: "image1.png", size: 500),
    Ressource(name: "image3.png", size: 12000),
  ];

  final List<DownloadController> controllers = [];

  DownloadsScreen({super.key}) {
    // Create a controllers for each ressource
    for (Ressource ressource in ressources) {
      controllers.add(DownloadController(ressource));
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorChangingNotifier colorChangingNotifier = context.watch<ColorChangingNotifier> ();
    return Container(
      // color: currentThemeColor.backgroundColor,
      color: colorChangingNotifier.themeColor.backgroundColor, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text(
            "Downloads",
            style: AppTextStyles.heading.copyWith(
              // color: currentThemeColor.color,
              color: colorChangingNotifier.themeColor.color , 
            ),
          ),

          SizedBox(height: 50),

          // TODO - Add the Download tiles
        ],
      ),
    );
  }
}
