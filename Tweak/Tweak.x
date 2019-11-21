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

%group Tick

%hook SBUIIconForceTouchViewController

-(BOOL)presentAnimated:(BOOL)arg1 withCompletionHandler:(/*^block*/id)arg2 {

	if (enabled) {
		playSound();

	}

	return %orig;

}

%end

%end

%ctor {
    pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.tickpreferences"];

    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
	[pfs registerObject:&loudnessLevel default:@"0" forKey:@"Loudness"];

    if(enabled)
    	%init(Tick);
}