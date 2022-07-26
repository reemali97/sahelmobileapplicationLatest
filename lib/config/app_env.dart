import 'package:flutter/material.dart';

import '../core/core.export.dart';
ScrollController? scrollController;

const AppEnvironment env = AppEnvironment.STAGING;
String handleBaseUrl() {
  switch (env) {
    case AppEnvironment.PRODUCTION:
      return 'http://saheldev.ai-elements.com:81/Admin';
    case AppEnvironment.STAGING:
      return'http://saheldev.ai-elements.com:81/Admin';
  }
}
// class ChoseEnv{
//   static final Map<String, dynamic> headers = {};
//
//   static dynamic getConfiguration(){
//     switch (env) {
//       case AppEnvironment.PRODUCTION:
//         return StagingEnv.fromJson() ;
//       case AppEnvironment.STAGING:
//         return ProductionEnv.fromJson();
//     }
//
//   }
//   static Map<String,dynamic> prodEnv= {
//     'baseUrl': 'x',
//
//   };
//
//   Map<String,dynamic> stgEnv= {
//     'baseUrl': 'y',
//
//   };
//
//   Map<String,dynamic> divEnv= {
//     'baseUrl': 'z',
//
//   };
// }
//
// class StagingEnv{
//   String? baseUrl;
//   Map<String,dynamic>? header;
//   StagingEnv({this.baseUrl,this.header});
//   factory StagingEnv.fromJson({Map<String, dynamic>? json}) {
//     return StagingEnv(
//       baseUrl: 'http://saheldev.ai-elements.com:81/Admin/',
//       header: {'http://saheldev.ai-elements.com:81/Admin/':'http://saheldev.ai-elements.com:81/Admin/',},
//
//     );
//   }
// }
// class ProductionEnv{
//   String? baseUrl;
//   Map<String,dynamic>? header;
//   ProductionEnv({this.baseUrl,this.header});
//   factory ProductionEnv.fromJson({Map<String, dynamic>? json}) {
//     return ProductionEnv(
//       baseUrl: 'test',
//       header: {'test':'http://saheldev.ai-',},
//
//     );
//   }
// }
//

