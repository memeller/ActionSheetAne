package pl.mllr.extensions.nativeActionSheet
{
	public interface IActionSheet
	{
		/**
		 *
		 * @param title Title to be displayed in the Alert.
		 * @param message Message to be displayed in the Alert.
		 * @param closeLabel Label for the close button.
		 * @param otherLabels shoud be a comma separated sting of button labels.
		 * for example "one,two,three"
		 *
		 */
		function showAlertWithTitle( title : String, closeLabel : String, destructiveLabel:String,otherLabels : String = "" ) : void;
	}
}