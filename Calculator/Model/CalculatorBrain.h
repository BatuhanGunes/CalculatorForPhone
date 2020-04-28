//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Batuhan Güneş on 28.07.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject {
    
    //değişkenlerimizi private şeklinde tanımlıyoruz.
@private
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
    
}

//çeşitli işlemlerimizi gerçekleştiriceğimiz methodlarımızı tanımlıyoruz.Bunları daha sonra calculatorBrain.m dosyasında daha detaylı oluşturucağız.
@property double operand;
//- (void)setOperand:(double)anOperand; Methodu yerine @property kullanarak set ve get methodlarını otomatik olarak oluşturduk.
- (void)performWaitingOperation;
- (double)performOperation:(NSString *)operation;

@end
