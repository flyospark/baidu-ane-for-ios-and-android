package 
{
    import flash.system.Capabilities;

    public class SYS
    {
		public static function get admobBannerID():String{
			return isIOS?"admob banner for ios":"admob banner for android";
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