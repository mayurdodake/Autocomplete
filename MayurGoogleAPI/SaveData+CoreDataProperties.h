//
//  SaveData+CoreDataProperties.h
//  MayurGoogleAPI
//
//  Created by Felix-ITS 012 on 11/01/17.
//  Copyright © 2017 Felix-ITS 012. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SaveData.h"

NS_ASSUME_NONNULL_BEGIN

@interface SaveData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *place;

@end

NS_ASSUME_NONNULL_END
