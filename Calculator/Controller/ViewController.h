//
//  ViewController.h
//  Calculator
//
//  Created by Batuhan Güneş on 28.07.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import <UIKit/UIKit.h>         //UIViewController üst nesnesinin yolu
#import "CalculatorBrain.h"     //Model sınıfı ile yapılan bağlantı

@interface ViewController : UIViewController
{
    //işlem sonucunun gösterildiği label'ı output olarak tanımlıyoruz
    IBOutlet UILabel *display;
    CalculatorBrain *Brain;       //Model sınıfının bir nesnesini oluşturuyoruz.
    BOOL userIsInTheMiddleOfTypingANumber;
    //Kullanıcının yazım sırasında rakamlara basıp basmadığını kontrol etmek adına bir değişken tanımlıyoruz (birden fazla haneli sayıların yazımı için
}

///controller bazında ne tür actions ların olduğunu tanımlıyoruz.
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end

