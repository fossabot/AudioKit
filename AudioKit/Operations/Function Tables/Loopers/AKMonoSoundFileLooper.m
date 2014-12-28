//
//  AKLoopingOscillator.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 6/16/12.
//  Copyright (c) 2012 Aurelius Prochazka. All rights reserved.
//

#import "AKLoopingOscillator.h"

@implementation AKLoopingOscillator
{
    AKParameter *amp;
    AKParameter *freqMultiplier;
    AKConstant *baseFrequency;
    AKSoundFile *soundFileTable;
    AKLoopingOscillatorType imod1;
}

- (instancetype)initWithSoundFileTable:(AKSoundFile *) fileTable {
    return [self initWithSoundFileTable:fileTable
                    frequencyMultiplier:akpi(1)
                              amplitude:akpi(1)
                                   type:AKLoopingOscillatorTypeNormal];
    
}

- (instancetype)initWithSoundFileTable:(AKSoundFile *) fileTable
                             amplitude:(AKParameter *)amplitude
{
    return [self initWithSoundFileTable:fileTable
                    frequencyMultiplier:akpi(1)
                              amplitude:amplitude
                                   type:AKLoopingOscillatorTypeNormal];
}

- (instancetype)initWithSoundFileTable:(AKSoundFile *)fileTable
                   frequencyMultiplier:(AKControl *)frequencyMultiplier
                             amplitude:(AKParameter *)amplitude
{
    return [self initWithSoundFileTable:fileTable
                    frequencyMultiplier:frequencyMultiplier
                              amplitude:amplitude
                                   type:AKLoopingOscillatorTypeNormal];
}


- (instancetype)initWithSoundFileTable:(AKSoundFile *)fileTable
                   frequencyMultiplier:(AKControl *)frequencyMultiplier
                             amplitude:(AKParameter *)amplitude
                                  type:(AKLoopingOscillatorType)type
{
    self = [super initWithString:[self operationName]];
    if (self) {
        soundFileTable = fileTable;
        amp = amplitude;
        freqMultiplier = frequencyMultiplier;
        baseFrequency = akpi(1);
        imod1 = type;
    }
    return self;
}

// Csound Prototype:
// ar1 (,ar2) loscil3 xamp, kcps, ifn (, ibas, imod1, ibeg1, iend1, imod2, ibeg2, iend2)
- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ loscil3 %@, %@, %@, %@, %@",
            self, amp, freqMultiplier, soundFileTable, baseFrequency, akpi(imod1)];
}

@end