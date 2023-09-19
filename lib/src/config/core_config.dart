import 'dart:io';

import 'list_config.dart';

class CoreConfig {
  //Production Mode will disable every debug thing
  static final bool productionMode = false;

  static final bool isDesktopClient = Platform.isWindows || Platform.isLinux;
  static final bool isMacOS = !isDesktopClient && Platform.isMacOS;

  static final String _urlBaseAPILocal = 'http://127.0.0.1:8001/btwedutech';
  static final String _urlBaseAPIDebug = 'https://api.btwazure.com/btwedutech';
  static final String _urlBaseAPI2Debug = 'https://api-v2.btwazure.com';

  // static final String _urlBaseAPI2Debug = 'http://127.0.0.1:8000';
  static final String _urlBaseAPIProduction =
      // 'https://api.btwedutech.com/btwedutech';
      'https://devops.tirtadanuarta.com/index.php/api';
  static final String _urlBaseAPI2Production = 'https://gw.btwedutech.com';
  static final String _urlBaseCDN = 'https://btw-cdn.com/assets/v3';
  static final String _notificationTopicDev = "dev_fcm";
  static final String _notificationTopicProd = "prod_fcm";
  static final String notificationTopicDebug = 'debug_fcm';

  static bool getDebuggableConfig(String configName) {
    return !productionMode ? ListConfig.getConfigList[configName] ?? false : false;
  }

  static bool getFixedConfig(String configName) {
    return ListConfig.getConfigList[configName] ?? false;
  }

  static String getApiUrl({int version = 1, int gatewayVersion = 1}) {
    String topic = '${_urlBaseAPIProduction}';
    // String topic = '${_urlBaseAPIProduction}/m/v${version}';
    // if (!productionMode) {
    //   topic =
    //       '${getDebuggableConfig("is_local_server") ? _urlBaseAPILocal : getDebuggableConfig("use_dev_api") ? (gatewayVersion == 1? _urlBaseAPIDebug :_urlBaseAPI2Debug):(gatewayVersion == 1? _urlBaseAPIProduction:_urlBaseAPI2Production)}/m/v${version}';
    // }
    return topic;
  }

  static String get getEnvironment {
    String topic = "prod";
    if (!productionMode) {
      topic = '${getDebuggableConfig("is_local_server") ? 'local' : getDebuggableConfig("is_debug") ? 'dev' : 'prod'}';
    }
    return topic;
  }

  static String get getUrlCDN {
    return _urlBaseCDN;
  }

// static String getTopic() {
//   String topic = !kReleaseMode && AppConfig.isDebug ? _topicDev : _topicProd;
//   if (kReleaseMode) {
//     topic = _topicProd;
//   }
//   if (AppConfig.isForceDebug) {
//     topic = _topicDev;
//   }

//   if (FeatureConfig.isOnKitchen) print('sub ' + topic);
//   return topic;
// }

// static String getTopicUnsubscribe() {
//   String topic =
//       !kReleaseMode && AppConfig.isDebug == false ? _topicDev : _topicProd;
//   if (kReleaseMode) {
//     topic = _topicDev;
//   }
//   if (AppConfig.isForceDebug) {
//     topic = _topicProd;
//   }
//   if (FeatureConfig.isOnKitchen) print('unsub ' + topic);
//   return topic;
// }
}
