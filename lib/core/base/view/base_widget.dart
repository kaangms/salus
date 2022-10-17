import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../init/store/connectivity_store.dart';
import '../../widget/alerts/platform_alert_dialog.dart';
import '../model/base_view_model.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final Function(T model)? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    _disposer = reaction((_) => _connectivityStore.connectivityStream.value, (result) {
      if (result is ConnectivityResult) {
        _statusConnectivity = result;
        if ((_statusConnectivity == ConnectivityResult.wifi ||
                _statusConnectivity == ConnectivityResult.mobile ||
                _statusConnectivity == ConnectivityResult.ethernet) &&
            _isOpenPopUp) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      }
      if (result == ConnectivityResult.none) {
        _isOpenPopUp = true;
        networkPopUp;
      }
    }, delay: 1000);
    model = widget.viewModel;
    //if (widget.onModelReady != null)
    widget.onModelReady(model);
    super.initState();
  }

  late ConnectivityResult _statusConnectivity;
  bool _isOpenPopUp = false;
  Future get networkPopUp {
    var currentContext = (model as BaseViewModel).context;
    return showPlatformAlertDialog(
      currentContext!,
      title: 'İnternet Bağlantı Hatası',
      content: 'Mobil veri veya Wifi kapalı görünüyor. Lütfen internetinizi kontrol edip tekrar bağlanınız',
      defaultActionText: 'Ayarlara Git',
      onPressed: () async {
        AppSettings.openAppSettings();
        // Navigator.of(context).pop();
      },
    );
  }

  final ConnectivityStore _connectivityStore = ConnectivityStore();
  late final ReactionDisposer _disposer;

  @override
  void dispose() {
    _disposer();
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
