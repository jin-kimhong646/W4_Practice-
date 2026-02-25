import 'package:flutter/material.dart';
import 'package:w4_download_app/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  DownloadStatus get status => controller.status;

  IconData getIcon(DownloadStatus status) {
    switch (status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
              color: AppColors.greyLight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.ressource.name),
                      status == DownloadStatus.notDownloaded
                          ? const SizedBox.shrink()
                          : Text(
                              "${(controller.progress * 100).round()} % completed - ${(controller.ressource.size * controller.progress).round()} of ${controller.ressource.size} MB",
                            ),
                    ],
                  ),
                  IconButton(
                    onPressed: controller.startDownload,
                    icon: Icon(getIcon(status)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
