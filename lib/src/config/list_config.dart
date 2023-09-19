class ListConfig{
  static Map<String, dynamic> _configList = {
    //Global Features
    "is_debug_mode": true,
    "use_dev_api": true,
    "is_local_server": false,
    "log_api_response": true,
    "is_beta": true,
    "available_targets": ["ptk", "ptn", "cpns"],

    //UI Features
    "feature_dark_mode": false,


    //Profile Option
    "show_faq": false,
    "show_change_password": false,

    //<per_page> Features
    "feature_example": false,
  };

  static Map<String, dynamic> get getConfigList {
    return _configList;
  }

}