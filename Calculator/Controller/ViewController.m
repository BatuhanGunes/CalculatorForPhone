//
//  ViewController.m
//  Calculator
//
//  Created by Batuhan Güneş on 28.07.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import "ViewController.h"      //viewController kaynak dosyasını importluyoruz.

@interface ViewController()
@property (readonly) CalculatorBrain * Brain;
@end


@implementation ViewController

//singleton(tek nesne) kuralına uymak adına nesnenin daha önce üretilip üretilmediğini test ediyoruz. Eğer üretilmemişse nesne oluşturuyoruz. Daha önce üretilmişse var olan nesneyi kullanıyoruz. Bu durum kaynak kullanımını en aza indirgenmesini sağlamakta
- (CalculatorBrain *)Brain{
    if(!Brain){
        Brain = [[CalculatorBrain alloc]init];
    }
    return Brain;
}

//rakam butonlarına tıklanıldığında bu işlemlerin gerçekleşmesini istiyoruz.
- (IBAction)digitPressed:(UIButton *)sender {
    
    //NSString *digit = [[sender titleLabel] text];   //Butonun üzerindeki yazıyı okuyoruz.
    NSString *digit = sender.titleLabel.text; //butonun üzerindeki yazıyı okuma işini property ile gerçekleştiriyoruz.Böylelikle kodun okunabilirliğide artmış oluyor. yani kısacası get methodunu kullanıyoruz.
    
    
    //eğer kullanıcı hala bir rakam ekliyorsa önceki sayıyı okuyup buna ilave ediyoruz ve tekrar ekrana basıyoruz. Eğer rakamdan farklı bir işlem yapıldıysa sayı oluşturma işlemini sonlandırıyoruz.
    if (userIsInTheMiddleOfTypingANumber) {
        //[display setText:[[display text] stringByAppendingString: digit]];
        display.text = [display.text stringByAppendingString:digit];    //setText methodu
    }else{
        //[display setText: digit];
        display.text = digit;   //set methodu
        userIsInTheMiddleOfTypingANumber = YES;
    }
}

//işlem butonlarına tıklanıldığında bu işlemlşerin gerçekleşmesini istiyoruz.
- (IBAction)operationPressed:(UIButton *)sender {
    
    //işlem yapmadan önce kullanıcının hala sayı üzerinde çalışıp çalışmadığını kontrol ediyoruz.
    if(userIsInTheMiddleOfTypingANumber){
        //[[self brain] setOperand: [[display text] doubleValue]]; Yerine .operand set methodunu çağırıyoruz(alt satırda tanımlı). Çünkü arka planda setOperand methodunu property ve synthesize kalıbı ile değiştirdik. Böylelikle erişimi kısıtlayarak güvenliğimizi arttırdık. Ayrıca operan değişkenimizide aynı olaydan dolayı private bir değişken haline getirdik.
        self.Brain.operand = [display.text doubleValue];
        userIsInTheMiddleOfTypingANumber = NO;
    }
    
    NSString *operation = [[sender titleLabel] text]; //hangi operatör olduğunu buttonun yazısından okuyoruz ve değişkene atıyoruz.
    //double result = [[self brain] performOperation:(operation)]; // işlem yapılıyor.
    [self.Brain performOperation:(operation)]; // işlem yapılıyor.
    display.text = [NSString stringWithFormat:@"%g", self.Brain.operand]; //Yapılan işlem sonucunu result label'ına %g formatında yazdırıyoruz.
}

@end
