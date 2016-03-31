//
//  MyPlayerManager.m
//  kundalini
//
//  Created by Christian Andersen on 26/10/12.
//
//

#import "MyPlayerManager.h"

@implementation MyMusicPlayerManager

@synthesize someProperty, audioPlayer;

#pragma mark Singleton Methods

typedef enum  {
    initializing = 0, paused = 1, playing=2, suspended = 3}
musicplayer;


+ (id)sharedManager {
    static MyMusicPlayerManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        songlist = [NSArray arrayWithObjects: @"01 A Hundred Blessings", @"01 Ong Namo", @"02 Aad Guray Nameh" , @"09 Breeze At Dawn" , @"10 Burn of the Heart",nil];
        
        [[AVAudioSession sharedInstance] setDelegate: self];
        NSError *setCategoryError = nil;
        [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
        if (setCategoryError)
            NSLog(@"Error setting category! %@", setCategoryError);
        
        indexsong = arc4random() % 5;
        if (indexsong==5)
            indexsong=4;
        
        state = initializing;
        serielqueue = dispatch_queue_create("com.snakeapp.serialQueue2", 0);
        dispatch_async(serielqueue,^(void)
                      {
                          NSBundle *mainBundle = [NSBundle mainBundle];
                          NSString *filePath = [mainBundle pathForResource:[songlist objectAtIndex:indexsong] ofType:@"mp3"];
                //          [songlist objectAtIndex:indexsong];
                          NSData *fileData = [NSData dataWithContentsOfFile:filePath];
                          NSError *error = nil;
                          self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
                          if (self.audioPlayer != nil)
                          {    self.audioPlayer.delegate = self;
                              [self.audioPlayer prepareToPlay];
                              [self.audioPlayer pause];
                          }
                          
                      });

    }
    return self;
}

-(void) Play {
    if (state == paused || state == initializing )
    {
        [self.audioPlayer play];
        state = playing;
    }
    else
    {
        [self.audioPlayer pause];
        state = paused;
    }
    
}


-(BOOL) IsMusicPlaying
{
    if (state == playing /*|| state == initializing*/ || state == suspended )
        return true;
    else
        return false;
}
    


-(void) ChkPaused {
    if (state == playing /*|| state == initializing */)
    {
        [self.audioPlayer pause];
        state = suspended;
    }
    else if (state == suspended)
    {
        
        [self.audioPlayer play];
        state = playing;
        
    }
}

-(void) ChkSuspended {
    if (state == suspended)
    {
        
        [self.audioPlayer play];
        state = playing;
        
    }
}




- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    indexsong++;
    if (indexsong < songlist.count) {
        //continue
    } else {
        indexsong = 0;
    }
    
    state = playing;
    serielqueue = dispatch_queue_create("com.snakeapp.serialQueue2", 0);
    dispatch_async(serielqueue,^(void)
                   {
                       NSBundle *mainBundle = [NSBundle mainBundle];
                       NSString *filePath = [mainBundle pathForResource:[songlist objectAtIndex:indexsong] ofType:@"mp3"];
                       [songlist objectAtIndex:0];
                       NSData *fileData = [NSData dataWithContentsOfFile:filePath];
                       NSError *error = nil;
                       self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
                       if (self.audioPlayer != nil)
                       {    self.audioPlayer.delegate = self;
                           [self.audioPlayer prepareToPlay];
                           [self.audioPlayer play];
                       }
                   });
    
        
        
        
}




- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end