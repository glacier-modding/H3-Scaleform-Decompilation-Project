package menu3.indicator
{
   import common.Localization;
   import common.menu.MenuConstants;
   import common.menu.MenuUtils;
   
   public class LevelCountIndicator extends ValueIndicatorBase
   {
       
      
      public function LevelCountIndicator(param1:String, param2:Number)
      {
         super(param1,param2);
         m_indicatorView.valueIcon.visible = false;
      }
      
      override public function onSetData(param1:*, param2:Object) : void
      {
         super.onSetData(param1,param2);
         var _loc3_:String = param2.levelcount + Localization.get("UI_DIALOG_SLASH") + param2.levelcounttotal;
         MenuUtils.setupText(m_indicatorView.escalationlevel,_loc3_,56,MenuConstants.FONT_TYPE_MEDIUM,MenuConstants.FontColorWhite);
         MenuUtils.truncateTextfield(m_indicatorView.escalationlevel,1);
      }
   }
}
