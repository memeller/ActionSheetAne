package pl.mllr.extensions.nativeActionSheet
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	import flashx.textLayout.formats.Float;

	public class ActionSheet extends EventDispatcher
	{
			//---------------------------------------------------------------------
			//
			// Constants
			//
			//---------------------------------------------------------------------
			
			private static const EXTENSION_ID : String = "pl.mllr.extensions.NativeActionSheet";
			
			//---------------------------------------------------------------------
			//
			// Private Properties.
			//
			//---------------------------------------------------------------------
			
			private var context : ExtensionContext;
			
			//---------------------------------------------------------------------
			//
			// Public Methods.
			//
			//---------------------------------------------------------------------
			
			public function ActionSheet()
			{
				if(!context)
				context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
			}
			
			/**
			 * Shows actionsheet (iPhone/iPod) 
			 * @param title Title to be displayed in the ActionSheet.
			 * @param closeLabel Label for the close button.
			 * @param destructiveLabel Label for the destructive button (red one).
			 * @param otherLabels shoud be a comma separated sting of button labels.
			 * for example "one,two,three"
			 */
			public function showActionSheet( title : String, closeLabel : String, destructiveLabel : String, otherLabels : String = "" ) : void
			{
				if(!context)
					context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
				context.addEventListener( StatusEvent.STATUS, onAlertHandler );
				context.call( "showActionSheet", title, closeLabel,destructiveLabel, otherLabels );
			}
			/**
			 * Shows actionsheet in a popover
			 * @param title Title to be displayed in the ActionSheet.
			 * @param closeLabel Label for the close button.
			 * @param destructiveLabel Label for the destructive button (red one).
			 * @param otherLabels shoud be a comma separated sting of button labels.
			 * for example "one,two,three"
			 * @param xPos x position of rectangle, that is used as starting point for popover
			 * @param yPos y position of rectangle, that is used as starting point for popover
			 * @param widthPos width of rectangle, that is used as starting point for popover
			 * @param heightPos height of rectangle, that is used as starting point for popover
			 */
			public function showActionSheetFromRect( title : String, closeLabel : String, destructiveLabel : String, otherLabels : String = "",xPos:Number=0,yPos:Number=0,widthPos:Number=100,heightPos:Number=100 ) : void
			{

				if(!context)
					context = ExtensionContext.createExtensionContext( EXTENSION_ID, null );
				context.addEventListener( StatusEvent.STATUS, onAlertHandler );
				context.call( "showActionSheetFromRect", title, closeLabel,destructiveLabel, otherLabels,xPos,yPos,widthPos,heightPos );
			}
			//---------------------------------------------------------------------
			//
			// Private Methods.
			//
			//---------------------------------------------------------------------
			
			/**
			 * @private
			 * When the Alert closes in the device we will redispatch the event
			 * through ActionScript so that we can handle the user interaction.
			 * The event will contain the index of the button that the user selected.
			 */
			private function onAlertHandler( event : StatusEvent ) : void
			{
				if( event.code == ActionSheetEvent.SHEET_CLOSE_EVENT )
				{
					dispatchEvent( new ActionSheetEvent( event.level ));
					context.removeEventListener( StatusEvent.STATUS, onAlertHandler );
				}
				context.removeEventListener( StatusEvent.STATUS, onAlertHandler );
		}
	}
}