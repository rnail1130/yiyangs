class config {
  //static const API_VER = "http://192.168.1.204:1024"; // 测试环境
  static const API_VER = "http://60.247.61.162:8020"; // 益阳演示环境

  //static const API_VER = "http://220.170.144.41:8001"; // 益阳正式环境

  static const IF_DEVELOP = true;
  static const VERSION = '2.0.4';
  //验证码获取的时间
  static const COUNTER = 10;
  //开发模式默认帐号是否开启
  static const ACCOUNT = true;
}

/// 绑卡账户 TiedCardAccount
/// 缴费账户 paymentAccount
/// 票卷卡包 cardBag
/// 会员账户 membershipAccount
/// 登录注册模块 login

/**
 * styles文件
 * app_style.dart
 * 定义静态的方法
 * eg:static const middleMinText = TextStyle(
 *       color: Color(AppColors.textWhite),
 *       fontSize: middleTextWhiteSize,);
 *   引入包：
 *   import 'package:myapp/styles/app_style.dart';
 */

/**
 *model文件
 * 注释：用于数据请求后 json序列化
 * 参考网址 https://www.jianshu.com/p/3754d1370ccc
 *        https://www.cnblogs.com/fuyaozhishang/p/9252286.html
 *        https://www.jianshu.com/p/14cbcbaa74b7
 * 数据生成网址 https://javiercbk.github.io/json_to_dart/
 *
 */

/**
 * urlMolde文件
 * 注释：用于请求接口的地址
 * eg：
 *    static const Weathers = "/Index.aspx/Weather";
    //获取天气的接口
    static getWeatherUrl (){
    return config.API_VER + Weathers;
    }
    调用：
    import 'package:myapp/urlModel/getHost.dart';
 */
