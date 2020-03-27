#line 1 "Tweak.xm"











#include "MBFingerTipWindow.h"


static MBFingerTipWindow *_rtWindow;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UIApplication; @class MBFingerTipOverlayWindow; @class UIWindow; 
static UIWindow * (*_logos_orig$_ungrouped$UIApplication$keyWindow)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static UIWindow * _logos_method$_ungrouped$UIApplication$keyWindow(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$MBFingerTipOverlayWindow$_shouldCreateContextAsSecure)(_LOGOS_SELF_TYPE_NORMAL MBFingerTipOverlayWindow* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$MBFingerTipOverlayWindow$_shouldCreateContextAsSecure(_LOGOS_SELF_TYPE_NORMAL MBFingerTipOverlayWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIWindow$sendEvent$)(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL, UIEvent *); static void _logos_method$_ungrouped$UIWindow$sendEvent$(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL, UIEvent *); 

#line 17 "Tweak.xm"




static UIWindow * _logos_method$_ungrouped$UIApplication$keyWindow(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd)  {
	UIWindow *o = _logos_orig$_ungrouped$UIApplication$keyWindow(self, _cmd);
	if (!_rtWindow)
	{
		_rtWindow = [[MBFingerTipWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		
	} 	
    return o;
}






static BOOL _logos_method$_ungrouped$MBFingerTipOverlayWindow$_shouldCreateContextAsSecure(_LOGOS_SELF_TYPE_NORMAL MBFingerTipOverlayWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}







static void _logos_method$_ungrouped$UIWindow$sendEvent$(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIEvent * event) {
	_logos_orig$_ungrouped$UIWindow$sendEvent$(self, _cmd, event);
	

	
	if (self==_rtWindow) return;

	
	if (_rtWindow) [_rtWindow sendEvent:event];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(keyWindow), (IMP)&_logos_method$_ungrouped$UIApplication$keyWindow, (IMP*)&_logos_orig$_ungrouped$UIApplication$keyWindow);Class _logos_class$_ungrouped$MBFingerTipOverlayWindow = objc_getClass("MBFingerTipOverlayWindow"); MSHookMessageEx(_logos_class$_ungrouped$MBFingerTipOverlayWindow, @selector(_shouldCreateContextAsSecure), (IMP)&_logos_method$_ungrouped$MBFingerTipOverlayWindow$_shouldCreateContextAsSecure, (IMP*)&_logos_orig$_ungrouped$MBFingerTipOverlayWindow$_shouldCreateContextAsSecure);Class _logos_class$_ungrouped$UIWindow = objc_getClass("UIWindow"); MSHookMessageEx(_logos_class$_ungrouped$UIWindow, @selector(sendEvent:), (IMP)&_logos_method$_ungrouped$UIWindow$sendEvent$, (IMP*)&_logos_orig$_ungrouped$UIWindow$sendEvent$);} }
#line 58 "Tweak.xm"
