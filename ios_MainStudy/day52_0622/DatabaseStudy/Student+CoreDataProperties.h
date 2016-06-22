//
//  Student+CoreDataProperties.h
//  DatabaseStudy
//
//  Created by Sangwook's Macbook on 2016. 6. 22..
//  Copyright © 2016년 swpark. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<School *> *school;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addSchoolObject:(School *)value;
- (void)removeSchoolObject:(School *)value;
- (void)addSchool:(NSSet<School *> *)values;
- (void)removeSchool:(NSSet<School *> *)values;

@end

NS_ASSUME_NONNULL_END
