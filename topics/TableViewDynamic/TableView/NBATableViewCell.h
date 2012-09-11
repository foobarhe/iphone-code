//
//  NBATableViewCell.h
//  TableView
//
//  Created by  on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBATableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *pImg;
@property (strong, nonatomic) IBOutlet UILabel *pTeam;
@property (strong, nonatomic) IBOutlet UILabel *pInfo;
@end
