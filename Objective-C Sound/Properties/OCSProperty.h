//
//  OCSProperty.h
//  Objective-C Sound
//
//  Created by Adam Boulanger on 6/15/12.
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//

#import "OCSConstant.h"

/** Properties allow data to be transferred to and from Csound.
 
 */
@interface OCSProperty : NSObject
{
    Float32 maximumValue;
    Float32 minimumValue;
    Float32 initValue;
    Float32 currentValue;
    
    OCSParameter *audio;
    OCSControl *control;
    OCSConstant *constant;
    OCSParameter *output;
}


/// Current value of the property.
@property (nonatomic, readwrite) Float32 value;

/// Minimum Value allowed.
@property (nonatomic, assign) Float32 minimumValue;

/// Maximum Value allowed.
@property (nonatomic, assign) Float32 maximumValue;

/// Initial value assigned.
@property (nonatomic, assign) Float32 initValue;

/// Audio (a-rate) output, theoretically.
@property (nonatomic, strong) OCSParameter *audio;

/// Control-rate (k-rate) output.
@property (nonatomic, strong) OCSControl *control;

/// Event-rate (i-rate) output.
@property (nonatomic, strong) OCSConstant *constant;

/// Catch-all output, necessary for parameterization.
@property (nonatomic, strong) OCSParameter *output;


/// Initialize the property with bounds.
/// @param minValue Minimum value.
/// @param maxValue Maximum value.
- (id)initWithMinValue:(float)minValue 
              maxValue:(float)maxValue;

/// Initialize the property with an initial value and bounds.
/// @param initialValue Initial value.
/// @param minValue Minimum value.
/// @param maxValue Maximum value.
- (id)initWithValue:(float)initialValue 
           minValue:(float)minValue 
           maxValue:(float)maxValue;




@end