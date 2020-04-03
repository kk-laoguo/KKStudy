//
//  KCHomeAdapter.m
//  JiaGou
//
//  Created by zainguo on 2020/3/22.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "KCHomeAdapter.h"

#import "KCHomeModel.h"


@implementation KCHomeAdapter


- (CGFloat)getCellHeight:(NSInteger)row {
    
    CGFloat height = SCREEN_WIDTH*608/1080 + 54;
    
    return 55;
    
//    KCChannelProfile *model = [self.getAdapterArray objectAtIndex:row];
//    if (model.title.length > 0) {
//        CGSize titleSize = [model.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
//        if (titleSize.width > SCREEN_WIDTH - 35) {
//            // 两行
//            height +=67;
//        }else{
//            height +=50;
//        }
//    }else{
//        height += 8;
//    }
//    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getCellHeight:indexPath.row];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.getAdapterArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    KCHomeModel *model = self.getAdapterArray[indexPath.row];
    cell = [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"tableView:cellForKCChannelProfile:"]) withObject:tableView withObject:model];
    
    return cell;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView
       cellForKCChannelProfile:(id)model {
    

    NSString *cellIdentifier = NSStringFromSelector(_cmd);
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    KCHomeModel *item = model;
    cell.textLabel.text = item.name;
//    [cell setCellContent:liveModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    id model = self.getAdapterArray[indexPath.row];
    if (self.adapterDelegate && [self.adapterDelegate respondsToSelector:@selector(didSelectCellData:)]) {
        [self.adapterDelegate didSelectCellData:model];
    }
}

@end
