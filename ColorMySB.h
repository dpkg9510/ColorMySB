enum wifiOptions {
  defaultWIFI = 0,
  RedWIFI = 1,
  BlueWIFI = 2,
  CyanWIFI = 3,
  MagentaWIFI = 4,
  YellowWIFI = 5,
  OrangeWIFI = 6,
  GreenWIFI = 7,
  GrayWIFI = 8,
};

enum cellOptions {
  defaultCELL = 0,
  RedCELL = 1,
  BlueCELL = 2,
  CyanCELL = 3,
  MagentaCELL = 4,
  YellowCELL = 5,
  OrangeCELL = 6,
  GreenCELL = 7,
  GrayCELL = 8,
};

enum textOptions {
  defaultTEXT = 0,
  RedTEXT = 1,
  BlueTEXT = 2,
  CyanTEXT = 3,
  MagentaTEXT = 4,
  YellowTEXT = 5,
  OrangeTEXT = 6,
  GreenTEXT = 7,
  GrayTEXT = 8,
};

enum imgOptions {
  defaultIMG = 0,
  RedIMG = 1,
  BlueIMG = 2,
  CyanIMG = 3,
  MagentaIMG = 4,
  YellowIMG = 5,
  OrangeIMG = 6,
  GreenIMG = 7,
  GrayIMG = 8,
};

@interface _UIStatusBarWifiSignalView 
@property (nonatomic, copy, readwrite) UIColor *activeColor;
@end

@interface _UIStatusBarCellularSignalView 
@property (nonatomic, copy, readwrite) UIColor *activeColor;
@end

@interface _UIStatusBarStringView : UILabel
@property (nonatomic, strong, readwrite) UIColor *textColor;
@end

@interface _UIStatusBarImageView : UIView
@property (nonatomic, copy, readwrite) UIColor *tintColor;
@end


@interface _UIStatusBarForegroundView : UIView

@property (nonatomic, copy, readwrite) UIColor *tintColor;

-(void)layoutSubviews;

@end

