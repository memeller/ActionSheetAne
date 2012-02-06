NativeActionSheet
Based on https://github.com/mccormicka/NativeAlert
This is my first extension and i'm not really good at objective c, but since it works, i thought, i would share.

Builds are available in ActionSheetAneBuild, so if you are not familliar with ane creation, you just need ActionSheet.ane and ActionSheet.swc,
the extensionId is pl.mllr.extensions.NativeActionSheet (specified in extension.xml)

Depending on the device, you should use (https://developer.apple.com/library/IOs/#documentation/UserExperience/Conceptual/MobileHIG/UIElementGuidelines/UIElementGuidelines.html)
iPhone/iPod
showActionSheet() - shows simple action sheet with title and buttons (cancel + destructive + optional buttons)
iPad
showActionSheetFromRect() - shows simple action sheet with title and buttons (cancel + destructive + optional buttons) in a form of popover from a specified rectangle.
I don't currently have an access to an iPhone/iPod device, so i could only test this on iPad - both methods worked.
You have to keep in mind, that popover ignores device orientation, so the specified rectangle is always calculated from the same corner, but i guess, that this is normal for showFromRect:inView:animated:
