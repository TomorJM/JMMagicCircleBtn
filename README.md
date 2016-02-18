# JMMagicCircleBtn
a magic loading button




![](https://github.com/tormorOoO/JMMagicCircleBtn/blob/master/JMCircleMagicButton/magicCircle.gif)


####使用示例:

```
#import "JMMagicCircleButton.h"
```

使用:
```
JMMagicCircleButton *btn = [[JMMagicCircleButton alloc] initWithFrame:CGRectMake(100, 200, 150, 40) withColor:[UIColor blueColor] Title:@"登录"];
```

对按钮文字内容和效果的修改,直接修改frontShowBtn属性:
```
[btn.frontShowBtn setTitle:@"登录" forState:UIControlStateNormal];

```

####动画思路点击[这里](http://www.jianshu.com/p/716b42c31f5c)
