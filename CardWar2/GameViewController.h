//
//  GameViewController.h
//  CardWar2
//
//  Created by Abderrahmane Mokrani on 17/10/2020.
//

#import <UIKit/UIKit.h>

#define MAX_SCORE 100

NS_ASSUME_NONNULL_BEGIN

@interface GameViewController : UIViewController {
    
    NSInteger playerScore;
    
    NSInteger cpuScore;
}

@property (weak, nonatomic) IBOutlet UIImageView *leftCardView;

@property (weak, nonatomic) IBOutlet UIImageView *rightCardView;

@property (weak, nonatomic) IBOutlet UILabel *playerScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *cpuScoreLabel;

@end

NS_ASSUME_NONNULL_END
