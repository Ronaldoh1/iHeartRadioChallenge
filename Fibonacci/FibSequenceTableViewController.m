//
//  TableViewController.m
//  Fibonacci
//
//  Created by Ronald Hernandez on 1/5/17.
//  Copyright © 2017 iHeartMedia. All rights reserved.
//

#import "FibSequenceTableViewController.h"

@interface FibSequenceTableViewController ()
@property (nonatomic, strong) NSArray *numbers;
@property int count;
@end

@implementation FibSequenceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Display initial 25 numbers
    self.count = 25;
    self.numbers = [self fibonacciSequenceFor:self.count];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numbers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellID = @"cellID";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID forIndexPath:indexPath];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.numbers[indexPath.row]];

    if (indexPath.row == self.numbers.count - 1) {
        self.count += 2;
        [self loadMore];

    }

    return cell;
}


#pragma mark - Helper Methods

- (int)generateFibonacciFor:(int)number {
    if (number == 0) {
        return 0;
    }
    if (number == 1) {
        return 1;
    }
    return [self generateFibonacciFor:number - 1] + [self generateFibonacciFor:number - 2];
}

- (void)loadMore {
    self.numbers = [self fibonacciSequenceFor: self.count];
    [self.tableView reloadData];
}

- (NSArray *)fibonacciSequenceFor:(int)count {
    NSMutableArray *array = [[NSMutableArray alloc] init];

    for(int i = 0; i<count; i++) {
      [array addObject:@([self generateFibonacciFor:i])];
    }

    return [NSArray arrayWithArray:array];
}

@end
