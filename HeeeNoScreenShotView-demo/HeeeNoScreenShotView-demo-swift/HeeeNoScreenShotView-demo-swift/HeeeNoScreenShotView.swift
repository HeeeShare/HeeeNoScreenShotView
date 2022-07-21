//
//  HeeeNoScreenShotView.swift
//  HeeeNoScreenShotView-demo-swift
//
//  Created by Heee on 2021/5/18.
//  注意：这个方法仅适用于iOS13及以后的系统

import UIKit

class HeeeNoScreenShotView: UIView {
  var textField : UITextField = {
    let tf = UITextField()
    tf.isSecureTextEntry = true
    return tf
  }()
  
  var clearView : UIView = {
    return UIView()
  }()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
  init() {
    super.init(frame: .zero)
    self.setupUI()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    self.addSubview(textField)
    if textField.subviews.first != nil {
      textField.subviews.first!.isUserInteractionEnabled = true
      textField.subviews.first!.addSubview(clearView)
    }
    
    NotificationCenter.default.removeObserver(self)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
  }
  
  @objc func keyboardWillShow() {
      if (textField.isFirstResponder) {
          textField.resignFirstResponder()
          if textField.subviews.first != nil {
            textField.subviews.first!.isUserInteractionEnabled = true
          }
      }
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    textField.frame = self.bounds
    clearView.frame = self.bounds
      
    if (textField.superview != self) {
        self.addSubview(textField)
    }
  }
  
  override func addSubview(_ view: UIView) {
    super.addSubview(view)
    if textField != view {
      clearView.addSubview(view)
    }
  }
}
