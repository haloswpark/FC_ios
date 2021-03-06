//
//  School+CoreDataProperties.h
//  DatabaseStudy
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "School.h"

NS_ASSUME_NONNULL_BEGIN

@interface School (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *students;

@end

@interface School (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(NSManagedObject *)value;
- (void)removeStudentsObject:(NSManagedObject *)value;
- (void)addStudents:(NSSet<NSManagedObject *> *)values;
- (void)removeStudents:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
