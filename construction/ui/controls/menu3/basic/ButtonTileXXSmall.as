package menu3.basic
{
   import flash.display.Sprite;
   import menu3.ButtonTileBase;
   
   public dynamic class ButtonTileXXSmall extends ButtonTileBase
   {
       
      
      public function ButtonTileXXSmall(param1:Object)
      {
         super(param1);
         m_view = new ButtonTileXXSmallView();
         m_view.tileSelect.alpha = 0;
         m_view.tileBg.alpha = 0;
         addChild(m_view as ButtonTileXXSmallView);
         initView();
      }
      
      override public function onSetData(param1:Object) : void
      {
         super.onSetData(param1);
         setupTextFields(param1.header,param1.title);
         updateState();
      }
      
      override public function getView() : Sprite
      {
         if(m_view == null)
         {
            return null;
         }
         return m_view.tileBg;
      }
      
      override public function onUnregister() : void
      {
         if(m_view)
         {
            completeAnimations();
            if(m_textTicker)
            {
               m_textTicker.stopTextTicker(m_view.title,m_textObj.title);
               m_textTicker = null;
            }
            removeChild(m_view as ButtonTileXXSmallView);
            m_view = null;
         }
      }
   }
}
