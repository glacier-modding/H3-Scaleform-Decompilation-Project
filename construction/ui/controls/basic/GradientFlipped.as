package basic
{
   import common.BaseControl;
   
   public class GradientFlipped extends BaseControl
   {
       
      
      private var m_view:GradientView;
      
      public function GradientFlipped()
      {
         super();
         this.m_view = new GradientView();
         this.m_view.alpha = 0.5;
         this.m_view.gotoAndStop(2);
         addChild(this.m_view);
      }
      
      override public function onSetSize(param1:Number, param2:Number) : void
      {
         this.m_view.width = param1;
         this.m_view.height = param2;
      }
   }
}
