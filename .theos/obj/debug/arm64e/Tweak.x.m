#line 1 "Tweak.x"
#import "Tick.h"

void playSound() {

	int loudness = [loudnessLevel intValue];

	SystemSoundID sound = 0;
	AudioServicesDisposeSystemSoundID(sound);

	if (loudness == 0) {
		AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Tick/tick.caf"]), &sound);

	} else if (loudness == 1) {
		AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Tick/tick2.caf"]), &sound);
		
	} else if (loudness == 2) {
		AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([NSURL fileURLWithPath:@"/Library/Application Support/Tick/tick3.caf"]), &sound);

	}

	AudioServicesPlaySystemSound((SystemSoundID)sound);

}


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

@class SBUIIconForceTouchViewController; 


#line 25 "Tweak.x"
static BOOL (*_logos_orig$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchViewController* _LOGOS_SELF_CONST, SEL, BOOL, id); static BOOL _logos_method$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchViewController* _LOGOS_SELF_CONST, SEL, BOOL, id); 



static BOOL _logos_method$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, id arg2) {

	if (enabled) {
		playSound();

	}

	return _logos_orig$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$(self, _cmd, arg1, arg2);

}





static __attribute__((constructor)) void _logosLocalCtor_36835025(int __unused argc, char __unused **argv, char __unused **envp) {
    pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.tickpreferences"];

    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
	[pfs registerObject:&loudnessLevel default:@"0" forKey:@"Loudness"];

    if(enabled)
    	{Class _logos_class$Tick$SBUIIconForceTouchViewController = objc_getClass("SBUIIconForceTouchViewController"); MSHookMessageEx(_logos_class$Tick$SBUIIconForceTouchViewController, @selector(presentAnimated:withCompletionHandler:), (IMP)&_logos_method$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$, (IMP*)&_logos_orig$Tick$SBUIIconForceTouchViewController$presentAnimated$withCompletionHandler$);}
}
