package 
{
    import flash.system.Capabilities;

    public class SYS
    {
		public static function get admobBannerID():String{
			return isIOS?"a152a806cf2f09b":"a15151168ba8c01";
		}
		public static function get baiduID():String{
			return isIOS?"debug":"debug";//百度debug id ios容易奔溃，最好是用正式id，并且不要开推送功能
		}
		public static function get isIOS():Boolean
		{
			return Capabilities.manufacturer.indexOf("iOS") != -1;
		}
		
    }
}