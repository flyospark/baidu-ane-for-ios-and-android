package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	
	import so.cuo.platform.baidu.*;

	public class demo extends Sprite
	{
		public function demo()
		{
			super();
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			var ui:UI=new UI(onClick);
			addChild(ui);
			ui.addButton("relation", 0, 0);
			ui.addButton("abs", 200, 0);
			ui.addButton("hide", 0, 100);
			ui.addButton("full", 200, 100);
			ui.addButton("video", 0, 200);
			
			ui.addButton("top",280,0);
			
			
			if (BaiDu.getInstance().supportDevice)
			{
				BaiDu.getInstance().setKeys("your app id");
				BaiDu.getInstance().cacheVideo();
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onBannerLeaveApplication, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialLeaveApplication, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialFailedReceive, onAdEvent);
				BaiDu.getInstance().addEventListener(BaiDuAdEvent.onInterstitialReceive, onAdEvent);
			}
		}

		private function onAdEvent(event:BaiDuAdEvent):void
		{
			trace("event" + event.type);
		}

		private function onClick(label:String):void
		{
			trace("click:" + label);
			if (!BaiDu.getInstance().supportDevice)
				return;
			if (label == "relation")
			{
				BaiDu.getInstance().showBanner(BaiDu.BANNER, RelationPosition.TOP_CENTER);
				
			}
			else if (label == "abs")
			{
				BaiDu.getInstance().showBannerAbsolute(BaiDu.BANNER, 50, 50);
			}
			else if (label == "hide")
			{
				BaiDu.getInstance().hideBanner();
			}
			else if (label == "video")
			{
				BaiDu.getInstance().showVideo(VideoType.VideoPause,new Rectangle(50,100,250,250));
			}
			else if (label == "full")
			{
				if (BaiDu.getInstance().isInterstitialReady())
				{
					BaiDu.getInstance().showInterstitial();
				}
				else
				{
					BaiDu.getInstance().cacheInterstitial();
				}
			}
		}
	}
}
