//
//  ViewController.m
//  iDropBall
//
//  Created by Bui Duc Khanh on 9/14/16.
//  Copyright © 2016 Bui Duc Khanh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ball;
    float ballRadius;
    
    NSTimer *timer;
    
    float maxY;
    
    float accelerator;
    float velocity;
    float y;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initGUI];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/60.0)
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}


// Ngừng timer khi kết thúc
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    // Do any additional setup after loading the view, typically from a nib.
    
    [timer invalidate];
    timer = nil;
}


// Khởi tạo giao diện và 1 số tham số toàn cục
- (void)initGUI {
    ballRadius = 56.0;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ball.center = CGPointMake(self.view.frame.size.width/2.0, ballRadius);
    
    [self.view addSubview:ball];
    
    velocity = 0.0;
    y = ballRadius;
    maxY = self.view.frame.size.height - ballRadius;

    
    accelerator = 4.0;
    
    
    NSLog(@"%f", maxY);
}

- (void)dropBall {
    velocity = velocity + accelerator;    // vt = v0 + a * t
    
    y = y + velocity;
    
    if (y > maxY)
    {
        velocity = -velocity * 0.95;
        
        y = maxY;
    }
    
    
    
    ball.center = CGPointMake(ball.center.x, y);
}
@end
