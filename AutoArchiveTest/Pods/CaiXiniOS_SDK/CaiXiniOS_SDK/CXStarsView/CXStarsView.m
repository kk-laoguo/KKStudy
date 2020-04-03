//
//  CXStarsView.m
//  CXMerchant
//
//  Created by zainguo on 2019/4/1.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "CXStarsView.h"

static CGFloat const margin = 5;

@interface CXStarsView () {
    
    float _starRating;
    float _lastRating;
    float _height;
    float _width;
    UIImage *_unSelectedImage;
    UIImage *_halfSelectedImage;
    UIImage *_fullSelectedImage;
}
@property (nonatomic, strong) UIImageView *s1;
@property (nonatomic, strong) UIImageView *s2;
@property (nonatomic, strong) UIImageView *s3;
@property (nonatomic, strong) UIImageView *s4;
@property (nonatomic, strong) UIImageView *s5;
@property (nonatomic, strong) UIImageView *s6;
@property (nonatomic, strong) UIImageView *s7;
@property (nonatomic,weak) id<CXStarsViewDelegate> delegate;

@end

@implementation CXStarsView

#pragma mark - Intial Methods
- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Public Methods
- (void)setImageWidth:(CGFloat)imgWidth
                space:(CGFloat)space
           deselected:(NSString *)deselectedName
         halfSelected:(NSString *)halfSelectedName
         fullSelected:(NSString *)fullSelectedName
             delegate:(id<CXStarsViewDelegate>)delegate {
    
    self.userInteractionEnabled = NO;
    _delegate = delegate;
    _unSelectedImage = [UIImage imageNamed:deselectedName];
    _halfSelectedImage = halfSelectedName == nil ? _unSelectedImage : [UIImage imageNamed:halfSelectedName];
    _fullSelectedImage = [UIImage imageNamed:fullSelectedName];
    _height = imgWidth;
    _width = imgWidth;
    if (!space) {
        space = margin;
    }
    _starRating = 0.0;
    _lastRating = 0.0;
    
    _s1 = [[UIImageView alloc] initWithImage:_unSelectedImage];
    _s2 = [[UIImageView alloc] initWithImage:_unSelectedImage];
    _s3 = [[UIImageView alloc] initWithImage:_unSelectedImage];
    _s4 = [[UIImageView alloc] initWithImage:_unSelectedImage];
    _s5 = [[UIImageView alloc] initWithImage:_unSelectedImage];
    
    [_s1 setFrame:CGRectMake(0,  0, _width, _height)];
    [_s2 setFrame:CGRectMake(_width + space,0, _width, _height)];
    [_s3 setFrame:CGRectMake(2 * (_width + space), 0, _width, _height)];
    [_s4 setFrame:CGRectMake(3 * (_width + space), 0, _width, _height)];
    [_s5 setFrame:CGRectMake(4 * (_width + space), 0, _width, _height)];
  
    _s1.tag = 1;
    _s2.tag = 2;
    _s3.tag = 3;
    _s4.tag = 4;
    _s5.tag = 5;
    
    if (!_isIndicator) {
        _s1.userInteractionEnabled = YES;
        _s2.userInteractionEnabled = YES;
        _s3.userInteractionEnabled = YES;
        _s4.userInteractionEnabled = YES;
        _s5.userInteractionEnabled = YES;
    }
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [_s1 addGestureRecognizer:tapGesture1];
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [_s2 addGestureRecognizer:tapGesture2];
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [_s3 addGestureRecognizer:tapGesture3];
    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [_s4 addGestureRecognizer:tapGesture4];
    UITapGestureRecognizer *tapGesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTap:)];
    [_s5 addGestureRecognizer:tapGesture5];
  
    [self addSubview:_s1];
    [self addSubview:_s2];
    [self addSubview:_s3];
    [self addSubview:_s4];
    [self addSubview:_s5];

    CGRect frame = [self frame];
    frame.size.width = _s5.frame.origin.x + _s5.frame.size.width;
    frame.size.height = _height;
    [self setFrame:frame];
    
}
/**
 *  设置评分值
 *  @param rating 评分值
 */
- (void)displayRating:(float)rating {
    
    [_s1 setImage:_unSelectedImage];
    [_s2 setImage:_unSelectedImage];
    [_s3 setImage:_unSelectedImage];
    [_s4 setImage:_unSelectedImage];
    [_s5 setImage:_unSelectedImage];
    if (rating > 0 && rating <1) {
        [_s1 setImage:_halfSelectedImage];
    }
    if (rating >= 1) {
        [_s1 setImage:_fullSelectedImage];
    }
    if (rating > 1 && rating < 2) {
        [_s2 setImage:_halfSelectedImage];
    }
    if (rating >= 2) {
        [_s2 setImage:_fullSelectedImage];
    }
    if (rating > 2 && rating <  3) {
        [_s3 setImage:_halfSelectedImage];
    }
    if (rating >= 3) {
        [_s3 setImage:_fullSelectedImage];
    }
    if (rating > 3 && rating < 4) {
        [_s4 setImage:_halfSelectedImage];
    }
    if (rating >= 4) {
        [_s4 setImage:_fullSelectedImage];
    }
    if (rating > 4 && rating < 5) {
        [_s5 setImage:_halfSelectedImage];
    }
    if (rating >= 5) {
        [_s5 setImage:_fullSelectedImage];
    }
    _starRating = rating;
    _lastRating = rating;
    if ([_delegate respondsToSelector:@selector(starsView:changedRating:)]) {
        [_delegate starsView:self changedRating:rating];
    }
}
- (void)imageTap:(UITapGestureRecognizer *)tap {
    CGFloat rating = tap.view.tag;
    [self displayRating:rating];
}

/**
 *  获取当前的评分值
 *  @return 评分值
 */
- (float)rating{
    return _starRating;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_isIndicator) {
        return;
    }
    CGPoint point = [[touches anyObject] locationInView:self];
    int newRating = (int) (point.x / _width/5*5) + 1;
    if (newRating > 5)
        return;
    if (point.x < 0) {
        return;
    }
    if (newRating != _lastRating){
        [self displayRating:newRating];
    }
}
#pragma mark - setter Methods
- (void)setIsIndicator:(BOOL)isIndicator{
    _isIndicator = isIndicator;
    if (isIndicator) {
        _s1.userInteractionEnabled = NO;
        _s2.userInteractionEnabled = NO;
        _s3.userInteractionEnabled = NO;
        _s4.userInteractionEnabled = NO;
        _s5.userInteractionEnabled = NO;
    }
}


@end
