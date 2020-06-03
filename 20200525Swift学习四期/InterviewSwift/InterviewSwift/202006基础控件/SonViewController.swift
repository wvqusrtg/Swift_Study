//
//  SonViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/6/3.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class SonViewController: BaseViewController {
    var number:Int!
    let colorMap = [
        1:UIColor.black,
        2:UIColor.orange,
        3:UIColor.blue
    ]
    init(number initNumber:Int) {
        self.number = initNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let numberLabel = UILabel(frame: CGRect(x: kMargin, y: kNavigationBarH, width: kScreenW-kMargin*2, height: kMargin*5))
        numberLabel.text = "第\(number!)页"
        numberLabel.textColor = UIColor.red
        numberLabel.backgroundColor = RGBColor(r: 0, g: 0, b: 0, alp: 0.5)
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
        
        
        //滑动
        let swipeUp = UISwipeGestureRecognizer(target:self, action:#selector(swipe(_:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
         
        let swipeDown = UISwipeGestureRecognizer(target:self, action:#selector(swipe(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipe = UIScreenEdgePanGestureRecognizer(target:self,
                                                     action:#selector(swipeAside(_:)))
        swipe.edges = UIRectEdge.left //从左边缘开始滑动
        self.view.addGestureRecognizer(swipe)
        
        //长按监听
        let longPress = UILongPressGestureRecognizer(target:self,
                                                   action:#selector(longPressDid(_:)))
        self.view.addGestureRecognizer(longPress)
    }
    
    /// 长按
    /// - Parameter sender: sender description
    @objc func longPressDid(_ sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            print("长按响应开始")
        } else {
            print("长按响应结束")
        }
    }
    
    /// 边缘滑动
    /// - Parameter recognizer: recognizer description
    @objc func swipeAside(_ recognizer:UIScreenEdgePanGestureRecognizer){
        print("left edgeswipe ok")
        let point = recognizer.location(in: self.view)
        //这个点是滑动的起点
        print(point.x)
        print(point.y)
    }
    /// 滑动响应事件
    /// - Parameter recognizer: recognizer description
    @objc func swipe(_ recognizer:UISwipeGestureRecognizer){
        if recognizer.direction == .up{
            print("向上滑动")
        }else if recognizer.direction == .down{
            print("向下滑动")
        }
        
        let point=recognizer.location(in: self.view)
        //这个点是滑动的起点
        print(point.x)
        print(point.y)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
