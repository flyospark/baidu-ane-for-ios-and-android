package
{
	import flash.display.Sprite;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import so.cuo.platform.ad.*;
	import so.cuo.platform.ad.adapters.*;
	import flash.events.MouseEvent;
	public class baiduadmob extends Sprite
	{
		public function baiduadmob()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			configAd();//set ad id
			AdManager.getInstance().showInterstitialOrCache();
			AdManager.getInstance().showBanner(AdSize.PHONE_PORTRAIT,AdPosition.BOTTOM_CENTER);
			
			stage.addEventListener(MouseEvent.CLICK,onClick);
		}
		private function configAd():void
		{
			var	adManager:AdManager=AdManager.getInstance();
			adManager.addEventListener(AdEvent.onBannerFailedReceive,this.onBannerFail);
			adManager.addEventListener(AdEvent.onInterstitialFailedReceive,this.onBannerFail);
			adManager.addEventListener(AdEvent.onBannerReceive,this.onAdReceived);
			adManager.addEventListener(AdEvent.onInterstitialReceive,this.onAdReceived);
			
			var list:Vector.<AdItem>=new Vector.<AdItem>();
//			list.push(new AdItem(new AdmobAdapter(), 10, SYS.admobBannerID,"",5));
			list.push(new AdItem(new BaiduAdapter(), 10,SYS.baiduID,SYS.baiduID,5));
			adManager.configPlatforms(list);
			
		}
		protected function onBannerFail(event:AdEvent):void
		{
			trace(event.type);
		}
		
		protected function onAdReceived(event:AdEvent):void
		{
			if (event.type == AdEvent.onBannerReceive)
			{
				trace(event.data.width, event.data.height);
			}
			if (event.type == AdEvent.onInterstitialReceive)
			{
				trace("flash showInterstitial");
			}
		}
		private function onClick(event:MouseEvent):void
		{
			AdManager.getInstance().showInterstitialOrCache();
		}
	}
}