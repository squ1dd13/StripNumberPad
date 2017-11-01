@interface TPRevealingRingView
    @property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook TPRevealingRingView

-(void)layoutSubviews{
    
    self.hidden = YES;      //Hide the overlay on the keypad buttons
    
}
%end

@interface PHHandsetDialerView
    @property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

%hook PHHandsetDialerView

- (void)layoutSubviews {
    %orig;
    //Hide the white UIViews around the keypad
    UIView *_leftBlankView = MSHookIvar<UIView *>(self, "_leftBlankView");
    UIView *_rightBlankView = MSHookIvar<UIView *>(self, "_rightBlankView");
    UIView *_topBlankView = MSHookIvar<UIView *>(self, "_topBlankView");
    UIView *_bottomBlankView = MSHookIvar<UIView *>(self, "_bottomBlankView");
    _leftBlankView.hidden = YES;
    _topBlankView.hidden = YES;
    _bottomBlankView.hidden = YES;
    _rightBlankView.hidden = YES;
    
}
%end

@interface PHHandsetDialerLCDView
    @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook PHHandsetDialerLCDView

-(void) layoutSubviews {
    %orig;
    
    self.backgroundColor = [UIColor clearColor];        //Make the 'LCD' view (where you type the number) transparent
}
%end

%hook UITabBar

-(UIColor *)tintColor {
    return [UIColor greenColor];            //Change the tab bar tint colour so it is easier to see (not working yet)
}

%end

%hook UITabBarSwappableImageView

-(BOOL)_showAlternate {
    return YES;             //Invert the grey areas of the tab bar items for better visibility (not working yet)
}

%end

@interface PHBottomBarButton
    @property (nonatomic, copy, readwrite) UIColor *backgroundColor;
@end

%hook PHBottomBarButton

-(void) layoutSubviews {
    %orig;
    
    self.backgroundColor = [UIColor clearColor];            //Hide the green area around the "call" button
}                                                           //To do: Update the PHBottomBarButton after exiting a call
%end

%hook UILabel

-(BOOL)textFollowsTintColor {
    
    return NO;      //Make sure the text isn't blue.
}

%end


