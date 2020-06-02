//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
//[26.Swift—抛异常(do..catch)与（try,try?,try!）的使用](https://www.jianshu.com/p/50b3d40f1150)


DispatchQueue.global().async {
    self.view.addSubview(self.imageView)
    DispatchQueue.main.async {
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.segmented.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self.segmented)
            make.height.equalTo(kMargin*5)
        }
    }
}

//: [Next](@next)
