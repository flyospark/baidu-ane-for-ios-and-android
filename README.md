baidu-ane-for-ios-and-android
=============================

百度ane是一个方便flash as3开发人员在flex，flash air 移动应用中添加百度移动广告联盟广告的ane插件，<br/>
支持flash air ios和flash air android，支持百度广告联盟全屏广告和banner广告<br/>
项目官方网址:https://github.com/lilili87222/baidu-ane-for-ios-and-android<br/>
百度广告联盟网站：http://munion.baidu.com/<br/>
admob广告ane地址:https://github.com/lilili87222/admob-for-flash
版本号：1.0<br/>
构建于：adobe air sdk 4.0，百度移动推广sdk android 3.42 ，百度移动应用广告ios sdk3.4.7<br/>
iphone4/ios7,iphone5/ios7,小米/android 4测试都ok<br/>

###使用：<br/>
1.在百度广告联盟网站创建应用，获取广告id和计费id<br/>
2.添加baidu1.0.ane到flex air项目或者flash android ，flash ios项目中。具体怎么在flex air项目中加ane可以在网上找<br/>
3.书写下面代码,正式上传应用到商店时把debug改成在百度网站获得的广告id和计费ID<br/>
```
if(BaiDu.getInstance().supportDevice){
	BaiDu.getInstance().setKeys("debug","debug");//	BaiDu.getInstance().setKeys("appsid","appsec");
	BaiDu.getInstance().showBanner(BaiDu.BANNER,RelationPosition.BOTTOM_CENTER);
}
```
4.确认xxx-app.xml中已经有ane的id代码
```
 <extensionID>so.cuo.platform.baidu</extensionID>
```
5.ios只需要上门4步，android版本需要比ios多出此步骤<br/>
     a.给应用添加相关权限，确认在xxx-app.xml中添加下面的权限代码
```
            <uses-permission android:name="android.permission.INTERNET"/>
	    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
	    <uses-permission android:name="android.permission.READ_PHONE_STATE"/>
	    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
	    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE"/>
	    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
     b.代码中添加广告的Activity，提交给百度审核时需要加俩meta-data，值是百度申请到的ID，提交到市场的时候可以删除
```
<application>
    	<meta-data android:name="BaiduMobAd_APP_ID" android:value="debug" /> 
	<meta-data android:name="BaiduMobAd_APP_SEC" android:value="debug" />
  	 <activity android:name="com.baidu.mobads.AppActivity" android:configChanges="keyboard|keyboardHidden|orientation"/> 
</application>
```

     c.打包出apk，把extra目录拖进apk中。可以用apktool做，也可以用winrar做，打开方式选择winrar，然后把extra目录拖进去，就可以了,拖进去后apk目录结构可以看截图<br/>
     d.给修改后的apk签名，可以用命令行的方式给apk签名（做法可以百度 给apk签名，专业做法），也可以用用"APK签名工具.exe"签名(简单菜鸟的做法)<br/>
6.apk或者ipa打包出来后需要提交到百度广告联盟审核，提交申请前记得把debug都换成应用的appsid和计费id<br/>

**ane其他api:**
- 	1.缓存加载百度全屏广告
- 	public function cacheInterstitial():void
- 	2.展示广告，展示前先需要缓存好
- 	public function showInterstitial():void
- 	3.检测百度移动全屏广告是否缓存好了
- 	public function isInterstitialReady():Boolean
- 	4.相对位置，展示百度移动应用banner广告
- 	public function showBanner(adSize:BaiDuSize, position:int):void
- 	5.绝对定位展示百度应用广告
- 	public function showBannerAbsolute(adSize:BaiDuSize, x:Number, y:Number):void
- 	6.隐藏banner广告
- 	public function hideBanner():void
**ane支持广告相关的各种事件在BaiDuAdEvent中的常量**
	1.广告隐藏<br/>
	public static const onBannerDismiss:String = "onBannerDismiss";
	2.广告加载失败<br/>
	public static const onBannerFailedReceive:String = "onBannerFailedReceive";
	3.点击广告离开应用<br/>
	public static const onBannerLeaveApplication:String = "onBannerLeaveApplication";
	4.展示广告<br/>
	public static const onBannerPresent:String = "onBannerPresent";
	5.接收到广告<br/>
	public static const onBannerReceive:String = "onBannerReceive";
	6.全屏广告关闭<br/>
	public static const onInterstitialDismiss:String = "onInterstitialDismiss";
	7.全屏广告加载失败<br/>
	public static const onInterstitialFailedReceive:String = "onInterstitialFailedReceive";
	8.点击了全屏广告跳出应用<br/>
	public static const onInterstitialLeaveApplication:String = "onInterstitialLeaveApplication";
	9.全屏广告将展示<br/>
	public static const onInterstitialPresent:String = "onInterstitialPresent";
	10.全屏广告加载成功<br/>
	public static const onInterstitialReceive:String = "onInterstitialReceive";