//
//  ViewController.swift
//  HeeeNoScreenShotView-demo-swift
//
//  Created by Heee on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let noScreenShotView = HeeeNoScreenShotView.init(frame: .init(x: 50, y: 50, width: 240, height: 200))
    noScreenShotView.backgroundColor = .init(white: 0.95, alpha: 1.0)
    self.view.addSubview(noScreenShotView)
    
    let privacyBtn = UIButton.init(frame: .init(x: 10, y: 30, width: 100, height: 40))
    privacyBtn.backgroundColor = .systemRed
    privacyBtn.setTitle("隐私按钮", for: .normal)
    privacyBtn.setTitleColor(.white, for: .normal)
    privacyBtn.titleLabel?.font = .systemFont(ofSize: 15)
    privacyBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
    noScreenShotView.addSubview(privacyBtn)
    
    let privacyLabel = UILabel.init(frame: .init(x: 130, y: 30, width: 100, height: 40))
    privacyLabel.textAlignment = .center
    privacyLabel.backgroundColor = .systemGreen
    privacyLabel.textColor = .black
    privacyLabel.font = .systemFont(ofSize: 15)
    privacyLabel.text = "隐私文字"
    noScreenShotView.addSubview(privacyLabel)
  }
  
  @objc func click() {
    print("点击了按钮")
  }
  
}

