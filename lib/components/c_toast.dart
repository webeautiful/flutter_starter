import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_starter/utils/utils.dart';

class CToast {
  static void dismiss() {
    SmartDialog.dismiss(tag: "1");
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  static void dismissLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  static void loading([String message = "loading..."]) {
    SmartDialog.showLoading(
      alignment: Alignment.center,
      clickMaskDismiss: false,
      builder: (_) {
        return CMessageToast(
          text: message,
          type: CMessageToastType.loading,
        );
      },
    );
  }

  static void success(String message) {
    dismissLoading();
    SmartDialog.show(
      keepSingle: true,
      tag: "1",
      alignment: Alignment.center,
      clickMaskDismiss: false,
      animationTime: const Duration(milliseconds: 300),
      displayTime: const Duration(seconds: 2),
      builder: (_) {
        return CMessageToast(
          text: message,
          type: CMessageToastType.success,
        );
      },
    );
  }

  static void fail(String message) {
    dismissLoading();
    SmartDialog.show(
      keepSingle: true,
      tag: "1",
      alignment: Alignment.center,
      clickMaskDismiss: false,
      animationTime: const Duration(milliseconds: 300),
      displayTime: const Duration(seconds: 2),
      builder: (_) {
        return CMessageToast(
          text: message,
          type: CMessageToastType.fail,
        );
      },
    );
  }

  static void info(String message) {
    dismissLoading();
    SmartDialog.show(
      keepSingle: true,
      tag: "1",
      alignment: Alignment.center,
      clickMaskDismiss: false,
      animationTime: const Duration(milliseconds: 300),
      displayTime: const Duration(seconds: 1, milliseconds: 500),
      builder: (_) {
        return CMessageToast(
          text: message,
          type: CMessageToastType.info,
        );
      },
    );
  }
}

enum CMessageToastType {
  success,
  fail,
  info,
  loading,
}

class CMessageToast extends StatelessWidget {
  final String text;
  final CMessageToastType type;
  const CMessageToast({super.key, required this.text, required this.type});

  Widget _topIcon() {
    switch (type) {
      case CMessageToastType.success:
        return Image(
          image: assetsImage('toast-success.gif'),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      case CMessageToastType.fail:
        return Image(
          image: assetsImage('toast-failed.gif'),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        );
      case CMessageToastType.loading:
        return Image(
          width: 50,
          height: 50,
          image: assetsImage('assets/images/toast-loading.gif'),
        );
      case CMessageToastType.info:
        return Image(
          width: 50,
          height: 50,
          image: assetsImage('assets/images/toast-loading.gif'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      height: 124,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(6),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _topIcon(),
          Text(
            text,
            softWrap: true,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
