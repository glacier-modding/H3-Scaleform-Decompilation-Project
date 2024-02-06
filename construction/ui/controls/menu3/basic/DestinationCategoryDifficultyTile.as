package menu3.basic
{
	import common.Animate;
	import common.Localization;
	import common.menu.MenuConstants;
	import common.menu.MenuUtils;
	import common.menu.textTicker;
	import flash.display.Sprite;
	import menu3.MenuElementLockableContentBase;
	import menu3.MenuImageLoader;
	import menu3.indicator.FreeDlcIndicator;
	
	public dynamic class DestinationCategoryDifficultyTile extends MenuElementLockableContentBase
	{
		
		private const HEADER_START_POS_Y:Number = 394;
		
		private const TITLE_START_POS_Y:Number = 409;
		
		private const TILEICON_START_POS_Y:Number = 373;
		
		private const TITLE_START_SCALE:Number = 0.8;
		
		private const TITLE_END_SCALE:Number = 1;
		
		private var m_view:DestinationCategoryDifficultyTileView;
		
		private var m_loader:MenuImageLoader;
		
		private var m_textObj:Object;
		
		private var m_textTicker:textTicker;
		
		private var m_stickerIndicator:FreeDlcIndicator;
		
		private var m_pressable:Boolean = true;
		
		private var m_alwaysDisplaySelectedState:Boolean = false;
		
		private var m_enableInfo:Boolean = false;
		
		private var m_difficultyMode:String;
		
		private var m_headerEndPosY:Number;
		
		private var m_titleEndPosY:Number;
		
		private var m_tileIconEndPosY:Number;
		
		public function DestinationCategoryDifficultyTile(param1:Object)
		{
			this.m_textObj = new Object();
			super(param1);
			this.m_view = new DestinationCategoryDifficultyTileView();
			MenuUtils.setColorFilter(this.m_view.image);
			MenuUtils.setupIcon(this.m_view.tileIcon, param1.icon, MenuConstants.COLOR_GREY_DARK, false, true, MenuConstants.COLOR_WHITE);
			this.m_view.tileIcon.alpha = 0;
			this.m_view.dropShadow.alpha = 0;
			this.m_tileIconEndPosY = this.m_view.tileIcon.y;
			this.m_view.tileIcon.y = this.TILEICON_START_POS_Y;
			this.m_view.tileSelect.alpha = 0;
			this.m_view.tileSelectPulsate.alpha = 0;
			this.m_view.tileBg.alpha = 0;
			this.m_view.tileDarkBg.alpha = 0.3;
			this.m_view.informationBg.alpha = 0;
			this.m_view.info.alpha = 0;
			MenuUtils.setTintColor(this.m_view.info.difficultyheader, MenuUtils.TINT_COLOR_GREY, false);
			MenuUtils.setTintColor(this.m_view.info.difficultytitle, MenuUtils.TINT_COLOR_GREY, false);
			MenuUtils.setTintColor(this.m_view.info.completion, MenuUtils.TINT_COLOR_GREY, false);
			this.m_headerEndPosY = this.m_view.header.y;
			this.m_view.header.y = this.HEADER_START_POS_Y;
			this.m_titleEndPosY = this.m_view.title.y;
			this.m_view.title.y = this.TITLE_START_POS_Y;
			this.m_view.title.scaleX = this.m_view.title.scaleY = this.TITLE_START_SCALE;
			addChild(this.m_view);
		}
		
		override public function onSetData(param1:Object):void
		{
			var _loc2_:Object = null;
			super.onSetData(param1);
			this.m_difficultyMode = param1.difficulty;
			if (getNodeProp(this, "pressable") == false)
			{
				MenuUtils.setTintColor(this.m_view.tileSelect, MenuUtils.TINT_COLOR_GREY, false);
				MenuUtils.setTintColor(this.m_view.tileSelectPulsate, MenuUtils.TINT_COLOR_GREY, false);
				this.m_view.informationBg.visible = false;
			}
			this.m_enableInfo = true;
			if (param1.hasOwnProperty("enableinfo"))
			{
				this.m_enableInfo = param1.enableinfo;
			}
			this.m_alwaysDisplaySelectedState = false;
			if (param1.hasOwnProperty("alwaysdisplayselectedstate"))
			{
				this.m_alwaysDisplaySelectedState = param1.alwaysdisplayselectedstate;
			}
			MenuUtils.removeColor(this.m_view.image);
			if (param1.forcetintnotowned === true)
			{
				MenuUtils.setColorFilter(this.m_view.image, "shop");
			}
			else
			{
				MenuUtils.setColorFilter(this.m_view.image);
			}
			if (this.m_alwaysDisplaySelectedState)
			{
				this.m_view.tileIcon.alpha = 1;
				this.m_view.tileIcon.y = this.m_tileIconEndPosY;
				if (this.m_enableInfo)
				{
					this.m_view.informationBg.visible = true;
					this.m_view.informationBg.alpha = 1;
					this.m_view.info.alpha = 1;
					this.m_view.header.y = this.m_headerEndPosY;
					this.m_view.title.scaleX = this.m_view.title.scaleY = this.TITLE_END_SCALE;
					this.m_view.title.y = this.m_titleEndPosY;
				}
			}
			this.setupTextFields(param1.header, param1.title);
			if (this.m_enableInfo)
			{
				this.setupDifficultyInfo(param1.difficultyheader, param1.difficulty, param1.completion);
			}
			else
			{
				this.setupDifficultyInfo("", "", "");
			}
			if (param1.image)
			{
				this.loadImage(param1.image);
			}
			if (param1.availability)
			{
				setAvailablity(this.m_view, param1, "small");
			}
			if (this.m_stickerIndicator != null)
			{
				this.m_stickerIndicator.onUnregister();
				this.m_stickerIndicator = null;
			}
			if (param1.stickertext != undefined)
			{
				this.m_stickerIndicator = new FreeDlcIndicator("small");
				_loc2_ = new Object();
				_loc2_.freedlc_header = param1.stickertext;
				_loc2_.freedlc_icon = param1.stickericon;
				this.m_stickerIndicator.onSetData(this.m_view, _loc2_);
			}
		}
		
		private function setupTextFields(param1:String, param2:String):void
		{
			this.m_textObj.header = param1;
			this.m_textObj.title = param2;
			MenuUtils.setupText(this.m_view.header, param1, 18, MenuConstants.FONT_TYPE_MEDIUM, MenuConstants.FontColorGreyUltraLight);
			MenuUtils.setupText(this.m_view.title, param2, 50, MenuConstants.FONT_TYPE_BOLD, MenuConstants.FontColorGreyUltraLight);
			MenuUtils.truncateTextfield(this.m_view.header, 1);
			MenuUtils.truncateTextfield(this.m_view.title, 1);
		}
		
		private function callTextTicker(param1:Boolean):void
		{
			if (!this.m_textTicker)
			{
				this.m_textTicker = new textTicker();
			}
			if (param1)
			{
				this.m_textTicker.startTextTicker(this.m_view.title, this.m_textObj.title);
			}
			else
			{
				this.m_textTicker.stopTextTicker(this.m_view.title, this.m_textObj.title);
				MenuUtils.truncateTextfield(this.m_view.title, 1, MenuConstants.FontColorWhite);
			}
		}
		
		private function changeTextColor(param1:uint):void
		{
			this.m_view.header.textColor = param1;
			this.m_view.title.textColor = param1;
		}
		
		private function showText(param1:Boolean):void
		{
			this.m_view.header.visible = param1;
			this.m_view.title.visible = param1;
		}
		
		private function setupDifficultyInfo(param1:String, param2:String, param3:String):void
		{
			var _loc4_:String = Localization.get("UI_DIFFICULTY_" + param2 + "_TITLE");
			MenuUtils.setupIcon(this.m_view.info.icon, "difficultylevel", MenuConstants.COLOR_GREY_DARK, true, false);
			MenuUtils.setupText(this.m_view.info.difficultyheader, param1, 18, MenuConstants.FONT_TYPE_NORMAL, MenuConstants.FontColorGreyUltraLight);
			MenuUtils.setupText(this.m_view.info.difficultytitle, _loc4_, 24, MenuConstants.FONT_TYPE_MEDIUM, MenuConstants.FontColorGreyUltraLight);
			MenuUtils.setupText(this.m_view.info.completion, param3, 18, MenuConstants.FONT_TYPE_NORMAL, MenuConstants.FontColorGreyUltraLight);
			MenuUtils.truncateTextfield(this.m_view.info.difficultyheader, 1);
			MenuUtils.truncateTextfield(this.m_view.info.difficultytitle, 1);
			MenuUtils.truncateTextfield(this.m_view.info.completion, 1);
		}
		
		private function loadImage(param1:String):void
		{
			var imagePath:String = param1;
			if (this.m_loader != null)
			{
				this.m_loader.cancelIfLoading();
				this.m_view.image.removeChild(this.m_loader);
				this.m_loader = null;
			}
			this.m_loader = new MenuImageLoader();
			this.m_view.image.addChild(this.m_loader);
			this.m_loader.center = true;
			this.m_loader.loadImage(imagePath, function():void
			{
				Animate.legacyTo(m_view.tileDarkBg, 0.3, {"alpha": 0}, Animate.Linear);
				MenuUtils.trySetCacheAsBitmap(m_view.image, true);
				m_view.image.height = MenuConstants.MenuTileLargeHeight;
				m_view.image.scaleX = m_view.image.scaleY;
				if (m_view.image.width < MenuConstants.MenuTileTallWidth)
				{
					m_view.image.width = MenuConstants.MenuTileTallWidth;
					m_view.image.scaleY = m_view.image.scaleX;
				}
			});
		}
		
		override public function getView():Sprite
		{
			return this.m_view.tileBg;
		}
		
		override protected function handleSelectionChange():void
		{
			super.handleSelectionChange();
			Animate.complete(this.m_view.tileSelect);
			MenuUtils.pulsate(this.m_view.tileSelectPulsate, false);
			Animate.complete(this.m_view.informationBg);
			Animate.complete(this.m_view.tileIcon);
			Animate.complete(this.m_view.info);
			Animate.complete(this.m_view.header);
			Animate.complete(this.m_view.title);
			if (m_loading)
			{
				return;
			}
			if (m_isSelected)
			{
				Animate.to(this.m_view.tileSelect, MenuConstants.HiliteTime, 0, {"alpha": 1}, Animate.ExpoOut);
				MenuUtils.pulsate(this.m_view.tileSelectPulsate, true);
				if (!this.m_alwaysDisplaySelectedState)
				{
					setPopOutScale(this.m_view, true);
					Animate.to(this.m_view.dropShadow, 0.3, 0, {"alpha": 1}, Animate.ExpoOut);
					Animate.to(this.m_view.tileIcon, MenuConstants.HiliteTime, 0, {"alpha": 1, "y": this.m_tileIconEndPosY}, Animate.ExpoOut);
					Animate.addFrom(this.m_view.tileIcon, 0.3, 0, {"scaleX": 0.5, "scaleY": 0.5}, Animate.ExpoOut);
					if (this.m_enableInfo)
					{
						Animate.to(this.m_view.informationBg, MenuConstants.HiliteTime, 0, {"alpha": 1}, Animate.ExpoOut);
						Animate.to(this.m_view.info, MenuConstants.HiliteTime, 0, {"alpha": 1}, Animate.ExpoOut);
					}
				}
				Animate.to(this.m_view.header, MenuConstants.HiliteTime, 0, {"y": this.m_headerEndPosY}, Animate.ExpoOut);
				Animate.to(this.m_view.title, MenuConstants.HiliteTime, 0, {"scaleX": this.TITLE_END_SCALE, "scaleY": this.TITLE_END_SCALE, "y": this.m_titleEndPosY}, Animate.ExpoOut);
			}
			else
			{
				setPopOutScale(this.m_view, false);
				Animate.kill(this.m_view.dropShadow);
				this.m_view.dropShadow.alpha = 0;
				this.m_view.tileSelect.alpha = 0;
				MenuUtils.pulsate(this.m_view.tileSelectPulsate, false);
				if (!this.m_alwaysDisplaySelectedState)
				{
					this.m_view.tileIcon.alpha = 0;
					this.m_view.tileIcon.y = this.TILEICON_START_POS_Y;
					if (this.m_enableInfo)
					{
						this.m_view.informationBg.alpha = 0;
						this.m_view.info.alpha = 0;
					}
				}
				this.m_view.header.y = this.HEADER_START_POS_Y;
				this.m_view.title.y = this.TITLE_START_POS_Y;
				this.m_view.title.scaleX = this.m_view.title.scaleY = this.TITLE_START_SCALE;
			}
		}
		
		override public function onUnregister():void
		{
			if (this.m_view)
			{
				super.onUnregister();
				this.completeAnimations();
				if (this.m_textTicker)
				{
					this.m_textTicker.stopTextTicker(this.m_view.title, this.m_textObj.title);
					this.m_textTicker = null;
				}
				if (this.m_loader)
				{
					this.m_loader.cancelIfLoading();
					this.m_view.image.removeChild(this.m_loader);
					this.m_loader = null;
				}
				removeChild(this.m_view);
				this.m_view = null;
			}
		}
		
		private function completeAnimations():void
		{
			Animate.complete(this.m_view.tileDarkBg);
			Animate.complete(this.m_view.tileSelect);
			MenuUtils.pulsate(this.m_view.tileSelectPulsate, false);
			Animate.complete(this.m_view.informationBg);
			Animate.complete(this.m_view.tileIcon);
			Animate.complete(this.m_view.info);
			if (m_infoIndicator != null)
			{
				Animate.complete(m_infoIndicator);
			}
			Animate.complete(this.m_view.header);
			Animate.complete(this.m_view.title);
		}
	}
}
