﻿// Decompiled by AS3 Sorcerer 6.78
// www.buraks.com/as3sorcerer

//menu3.indicator.EscalationLevelIndicator

package menu3.indicator {
import common.Localization;
import common.menu.MenuUtils;
import common.menu.MenuConstants;

public class EscalationLevelIndicator extends ValueIndicatorBase {

	public function EscalationLevelIndicator(_arg_1:String, _arg_2:Number) {
		super(_arg_1, _arg_2);
		m_indicatorView.valueIcon.visible = false;
	}

	override public function onSetData(_arg_1:*, _arg_2:Object):void {
		super.onSetData(_arg_1, _arg_2);
		var _local_3:String = (((int(_arg_2.completedlevels) + 1) + Localization.get("UI_DIALOG_SLASH")) + _arg_2.totallevels);
		MenuUtils.setupText(m_indicatorView.escalationlevel, _local_3, 56, MenuConstants.FONT_TYPE_MEDIUM, MenuConstants.FontColorWhite);
		MenuUtils.truncateTextfield(m_indicatorView.escalationlevel, 1);
	}


}
}//package menu3.indicator

