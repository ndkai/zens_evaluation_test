import 'package:flutter/material.dart';

class ProviderWidget<T> extends StatelessWidget {
  final Future<T?> future;
  final Widget Function() onLoading;
  final Widget Function(String) onError;
  final Widget Function(T?) onLoaded;
  const ProviderWidget({super.key, required this.future, required this.onLoading, required this.onError, required this.onLoaded});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading();
        }
        if(snapshot.hasError && snapshot.connectionState != ConnectionState.waiting){
          return onError(snapshot.data.toString());
        }
        if(snapshot.hasData && snapshot.connectionState != ConnectionState.waiting){
          return onLoaded(snapshot.data);

        }
        return Container();
      },
    );
  }
}
