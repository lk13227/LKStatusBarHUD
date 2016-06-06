# LKStatusBarHUD
一个顶部指示器，类似百度贴吧之类

## 显示成功信息
```objc
[LKStatusBarHUD showSuccess:@"加载成功"];
```

## 显示失败信息
```objc
[LKStatusBarHUD showError:@"加载失败"];
```

## 显示加载信息
```objc
[LKStatusBarHUD showLoading:@"加载中....."];
```

## 显示自订信息
```objc
[LKStatusBarHUD showSuccess:@"自订字符串" image:image];
```

## 隐藏
```objc
[LKStatusBarHUD hide];
```