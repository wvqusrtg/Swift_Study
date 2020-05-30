var strStart = "Hello, playground-Start"
var strEnd = "Hello, playground-End"
print(strStart)

import UIKit
import PlaygroundSupport

let view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
view.backgroundColor = UIColor.red
PlaygroundPage.current.liveView = view

let imageView = UIImageView(image: UIImage(named: "Swift_Small"))
PlaygroundPage.current.liveView = imageView

let vc = UITableViewController()
vc.view.backgroundColor = .lightGray
PlaygroundPage.current.liveView = vc

for tick in stride(from: 1, to: 11, by: 2){
    print("不包含结尾数据---\(tick)")
}

for tick in stride(from: 1, through: 11, by: 2){
    print("包含结尾数据---\(tick)")
}

var numbers = [10,20,-44,40,80]
var sum = 0
for num in numbers where num > 0 {
    print("符合条件的num=\(num)")
    sum += num
}
print(sum)

print(strEnd)
