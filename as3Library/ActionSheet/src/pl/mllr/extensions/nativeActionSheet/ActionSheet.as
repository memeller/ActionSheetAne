package pl.mllr.extensions.nativeActionSheet
{
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
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
			 * @param title Title to be displayed in the Alert.
			 * @param message Message to be displayed in the Alert.
			 * @param closeLabel Label for the close button.
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