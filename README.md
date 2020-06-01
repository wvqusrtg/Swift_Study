# Swift_Study
Swift_Study

![](./Res/20200507Sketch绘制图标/ObjectC_Small.png)
![](./Res/20200507Sketch绘制图标/Swift_Small.png)

---

2020年06月01日


[25.hangge_README.md](./hangge_README.md)

23.Common.swift 自定义MBProgressHUD提示框-by:nixs 2020年06月01日09:05:18

---

2020年05月29日

22.Podfile更新重新引入
```
#RxSwift
 pod 'RxSwift', '~> 5.0'
 pod 'RxCocoa', '~> 5.0'
```

21.注:今天不能来现场办公了,流量不够只能看网页资料了
    
[RxSwift中文文档](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/)
    
```
简介

2016 RxSwift: ReactiveX for Swift

ReactiveX（简写: Rx） 是一个可以帮助我们简化异步编程的框架。
    RxSwift 是 Rx 的 Swift 版本。
    它尝试将原有的一些概念移植到 iOS/macOS 平台。
    你可以在这里找到跨平台文档 ReactiveX.io。
    KVO，异步操作 和 流 全部被统一成抽象序列。这就是为什么 Rx 会如此简单，优雅和强大。
```
---

2020年05月28日

20.Playground 导入 import UIKit 、import PlaygroundSupport支持显示视图

19.[哔哩哔哩BiliBili MJ-Swift学习- 20200528Swift学习五期](https://www.bilibili.com/video/BV1eE411M7Ha?p=1)
```
    Playground能分页编写-这个比较有用（收回我原来说的Playground不好用）
    Command+Shift+Enter:运行整个Playground
    Shift+Enter:运行截止到某一行代码
```

18.[SnapKit框架解析（一） —— SnapKit应用的一个简单示例（一）](https://www.jianshu.com/p/daa3496c9736)
    ![](./Res/20200507Sketch绘制图标/SnapKit.png)
```
18.1 Common公共类、Base基类、Home等目录更新；
18.2 func initView() {
        self.view.addSubview(bgView)
        //这里SnapKit使用了闭包
        bgView.snp.makeConstraints { (ConstraintMaker) in
            //注意这里直接就适配顶部和底部的安全距离了
            ConstraintMaker.top.equalTo(self.view.snp_topMargin).offset(kMargin);
            ConstraintMaker.bottom.equalTo(self.view.snp_bottomMargin).offset(-kMargin);
            ConstraintMaker.left.equalTo(kMargin)
            ConstraintMaker.right.equalTo(-kMargin)
        }
        bgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(bgView.snp_topMargin).offset(kMargin)
            make.leading.equalTo(kMargin)
            make.trailing.equalTo(-kMargin)
        }
    }
```
17.[NewToday 仿写今日头条项目-基础Common类封装、Alamofire封装 - 20200524Swift学习四期](./20200524Swift学习四期)

16.[16.100 Days of SwiftUI-待学习 - 20200521Swift学习三期](https://www.jianshu.com/p/dc1ef05d9d4f)

---
2020年05月22日

15.[(翻译) SwiftUI -- 手势的实现 - 20200521Swift学习三期](https://www.jianshu.com/p/457ef71cb8e8)

---

2020年05月21日

14.[五、(翻译) SwiftUI -- 创建详情页 - 20200521Swift学习三期](https://www.jianshu.com/p/f71231a19297)

13.[四、(翻译) SwiftUI -- 理解 Binding - 20200521Swift学习三期](https://www.jianshu.com/p/ed9d278a04a0)

12.[三、(翻译)SwiftUI -- 动态列表和 Identifiable - 20200521Swift学习三期](https://www.jianshu.com/p/2713f904a405)

11.[二、(翻译) SwiftUI - 理解 State - 20200521Swift学习三期](https://www.jianshu.com/p/aace56356aa7)

10.[一、(翻译) SwiftUI - 怎样去开始一个新项目 - 20200521Swift学习三期](https://www.jianshu.com/p/3828c5a5ba92)

9.[Swift 5.1 极简参考手册 - ./Swift_Study/20200521Swift学习二期/SwiftBasicReview/SwiftBasicReview/main.swift](https://blog.csdn.net/zsxjtip/article/details/104155074?ops_request_misc=&request_id=&biz_id=102&utm_term=swift5.1&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-3-104155074) 
```    
2020年05月14日
8.Swift 教程：https://swiftgg.gitbook.io/swift/swift-jiao-cheng
    「Playground编写测试代码有些提示不支持-还是改用Xcode吧！」
    1.基础部分
    20200510Swift学习一期「留存」
```
---
```
2020年05月07日
7.cell选择动作取消
6.表格布局简单初步尝试(表格cell的点击事件-字符串拼接)
5.引入cocopods / pod 'SnapKit'
4.Sketch 结合 App Icon Gear绘制图标更新(感觉图标还是得再更新不太好看-文字边框改为了白色，其他渐变)
```
---
```
2020年05月06日
3.Swift项目 SceneDelegate非Storyboard方式启动
2.Object-C项目、Swift 项目 iOS 13 SceneDelegae适配-纯代码
1.Xcode Version 11.4.1新建Swift项目
```