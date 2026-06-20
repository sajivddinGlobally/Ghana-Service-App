import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsConditionWebView extends StatefulWidget {
  const TermsConditionWebView({super.key});

  @override
  State<TermsConditionWebView> createState() => _TermsConditionWebViewState();
}

class _TermsConditionWebViewState extends State<TermsConditionWebView> {
  late final WebViewController controller;

  bool isLoading = true;
  int progress = 0;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                isLoading = true;
                progress = 0;
              });
            }
          },
          onProgress: (int value) {
            if (mounted) {
              setState(() {
                progress = value;

                if (value >= 100) {
                  isLoading = false;
                }
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                progress = 100;
                isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          "https://csgmaintenance.com/terms-conditions/",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        elevation: 0,
        title: const Text("Terms & Conditions"),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),

          if (isLoading)
            Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: AppColors.buttonBg,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Loading... $progress%",
                      style: TextStyle(
                        color: AppColors.buttonText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}