package pl.mllr.extensions.nativeActionSheet
{
	import flash.events.Event;
	
	public class ActionSheetEvent extends Event
	{
		public static const SHEET_CLOSE_EVENT : String = "ALERT_CLOSED";
		private var _index : String;
		public function get index() : String
		{
			return _index;
		}
		public function ActionSheetEvent(index : String)
		{
			_index = index;
			super(SHEET_CLOSE_EVENT);
		}
		override public function clone():Event
		{
			return new ActionSheetEvent(index);
		}
	}
}