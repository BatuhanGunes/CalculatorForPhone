//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Batuhan Güneş on 28.07.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import "CalculatorBrain.h"     //calculatorBrain kanak dosyasını importluyoruz.

@implementation CalculatorBrain

@synthesize operand;
/*
 aşağıdaki setOperan methodu yerine synthesiz operand tanımını kullanarak set ve get methodlarını çağırmış olduk.
 
- (void)setOperand:(double)anOperand;
{
    operand = anOperand;
}
*/

//Bir operatör çağırıldığında bu methoda geliyoruz ve çağırılan operatörün hangisi olduğuna kara verip, operatörün karşılığında hangi işlemin gerçekleşmesini istediğimizi belirtiyoruz.
-(void)performWaitingOperation{
    
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    }else if ([@"-" isEqual:waitingOperation]){
        operand = waitingOperand - operand;
    }else if ([@"*" isEqual:waitingOperation]){
        operand = waitingOperand * operand;
    }else if ([@"/" isEqual:waitingOperation]){
        //Paydaya sıfır yazıldığında hata vermesini önlüyoruz.(güzel bir çözüm değil)
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

//Kök alma işlemi diğer operatörlere nazaran daha farklı olduğu için farklı bir method altında bu işlemi yapma gereksinimi duyuyoruz. Bu farklılıkların en büyüğü hesap makinemizdeki diğer operatörler iki farklı sayı üzerinde çalışırken sqrt operatörü tek bi sayı üzerinde çalışmaktadır.
- (double)performOperation:(NSString *)operation
{
    //operatörümüzün sqrt olup olmadığını teyit ediyoruz. ve işlemimizi gerçekleştiriyoruz.
    if([operation isEqual:@"sqrt"]){
        operand = sqrt(operand);
    }else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

@end
