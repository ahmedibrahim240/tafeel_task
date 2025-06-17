import 'package:flutter/material.dart';

Widget defaultEmptyWidget(BuildContext context, {String? image, String? sms}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Icon(Icons.no_accounts_outlined, size: 50),
          SizedBox(height: 15),
          Text("NO DATA"),
        ],
      ),
    ),
  );
}

Widget defaultLoadingWidget() {
  return const Center(child: CircularProgressIndicator.adaptive());
}

Widget defaultErrorWidget(dynamic error, VoidCallback onRetry, BuildContext context, {String? image}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),

        Icon(Icons.error_outline, size: 50, color: Colors.red),

        SizedBox(height: 15),
        Text(error, style: TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onRetry,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.sizeOf(context).width * .5, 48),
            backgroundColor: Colors.red,
          ),
          child: Text("retry"),
        ),
      ],
    ),
  );
}
