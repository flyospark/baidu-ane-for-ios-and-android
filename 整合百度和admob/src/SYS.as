package 
{
    import flash.system.Capabilities;

    public class SYS
    {
		public static function get admobBannerID():String{
			return isIOS?"a152a806cf2f09b":"a15151168ba8c01";
		}
		public static function get baiduID():String{
			return isIOS?"debug":"debug";//�ٶ�debug id ios���ױ��������������ʽid�����Ҳ�Ҫ�����͹���
		}
		public static function get isIOS():Boolean
		{
			return Capabilities.manufacturer.indexOf("iOS") != -1;
		}
		
    }
}