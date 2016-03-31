//
//  MyPlayerManager.h
//  kundalini
//
//  Created by Christian Andersen on 26/10/12.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MyMusicPlayerManager : NSObject  <AVAudioPlayerDelegate> {
    NSString *someProperty;
    
    BOOL dispatchrunning;
    BOOL playerrunning;
    dispatch_queue_t serielqueue;
    int state;
    int indexsong;
    NSArray *songlist;
    
}

@property (nonatomic, retain) NSString *someProperty;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

+ (id)sharedManager;
- (void)Play;
-(BOOL) IsMusicPlaying;
-(void) ChkPaused;
-(void) ChkSuspended;
@end