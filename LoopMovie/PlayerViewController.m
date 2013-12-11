//
//  PlayerViewController.m
//  SlideApp
//
//  Created by 小林 博久 on 2013/12/11.
//  Copyright (c) 2013年 hogelab.net. All rights reserved.
//

#import "PlayerViewController.h"


@interface PlayerViewController ()

- (void)onPreparedToPlayDidChange:(NSNotification*)notification;
- (void)onPlaybackDidFinish:(NSNotification*)notification;

@end


@implementation PlayerViewController

- (id)init
{
    self = [super init];
    if (self) {
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSString *path = [[NSBundle mainBundle] pathForResource:@"cover"
													 ofType:@"mp4"];
	NSURL *url = [NSURL fileURLWithPath:path];
    [self.moviePlayer setContentURL:url];

    self.moviePlayer.fullscreen = YES;
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.repeatMode = MPMovieRepeatModeOne;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPreparedToPlayDidChange:)
                                                 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:self.moviePlayer];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onPlaybackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.moviePlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void) onPreparedToPlayDidChange:(NSNotification*)notification
{
}


- (void) onPlaybackDidFinish:(NSNotification*)notification
{
    NSDictionary* userInfo = [notification userInfo];
    int ret = [[userInfo objectForKey:@"MPMoviePlayerPlaybackDidFinishReasonUserInfoKey"] intValue];
    switch(ret){
        case MPMovieFinishReasonPlaybackEnded:
//            [self.moviePlayer stop];
            [self.moviePlayer play];
            break;

        case MPMovieFinishReasonPlaybackError:
            break;

        case MPMovieFinishReasonUserExited:
            break;
    }
}

@end
