//
//  GameViewController.m
//  CardWar2
//
//  Created by Abderrahmane Mokrani on 17/10/2020.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    playerScore = 0;
    cpuScore = 0;
}

- (IBAction)closeButtonClicked {
//    [self.navigationController popViewControllerAnimated:true];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Giving up!" message:@"You don't feel up to it 😓?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *continueGame = [UIAlertAction actionWithTitle:@"I'll do it 👊" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *endGame = [UIAlertAction actionWithTitle:@"Not today 🥱" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:true];
    }];
    
    [alert addAction:continueGame];
    [alert addAction:endGame];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)dealButtonClicked {
    int playerCardNumber = [self randomIntegerBetween:2 and:14];
    int cpuCardNumber = [self randomIntegerBetween:2 and:14];
    
    UIImage *playerNewImage = [UIImage imageNamed:[NSString stringWithFormat:@"card%d", playerCardNumber]];
    [_leftCardView setImage:playerNewImage];
    
    UIImage *cpuNewImage = [UIImage imageNamed:[NSString stringWithFormat:@"card%d", cpuCardNumber]];
    [_rightCardView setImage:cpuNewImage];
    
    if (playerCardNumber > cpuCardNumber) {
        playerScore += playerCardNumber - cpuCardNumber;
    } else if (cpuCardNumber > playerCardNumber) {
        cpuScore += cpuCardNumber - playerCardNumber;
    }
    
    [_playerScoreLabel setText:[NSString stringWithFormat:@"%ld", playerScore]];
    [_cpuScoreLabel setText:[NSString stringWithFormat:@"%ld", cpuScore]];
    
    if (playerScore >= MAX_SCORE) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Congratulations!" message:@"🎉 We have a winner! 🎉" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:true];
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    } else if (cpuScore >= MAX_SCORE) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"Try again! 😵" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction: [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.navigationController popViewControllerAnimated:true];
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (int)randomIntegerBetween:(int)from and:(int)to {
    return (int)(from + arc4random_uniform(to - from + 1));
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
