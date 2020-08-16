//
//  UIView+Extension.swift
//  SimpleEcommerce
//
//  Created by Febbry Ramadhan on 13/08/20.
//  Copyright © 2020 Febbry Ramadhan. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
    private var _round = false
    private var _borderColor = UIColor.clear
    private var _borderWidth: CGFloat = 0
    private var _cornerRadius: CGFloat = 0
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            _cornerRadius = newValue
            setCornerRadius()
        }
        get {
            return self._cornerRadius
        }
    }
    
    @IBInspectable var round: Bool {
        set {
            _round = newValue
            makeRound()
        }
        get {
            return self._round
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            _borderColor = newValue
            setBorderColor()
        }
        get {
            return self._borderColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            _borderWidth = newValue
            setBorderWidth()
        }
        get {
            return self._borderWidth
        }
    }
    
    override internal var frame: CGRect {
        set {
            super.frame = newValue
            makeRound()
        }
        get {
            return super.frame
        }
    }
    
    private func makeRound() {
        if self.round {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }
    
    private func setBorderColor() {
        self.layer.borderColor = self._borderColor.cgColor
    }
    
    private func setBorderWidth() {
        self.layer.borderWidth = self._borderWidth
    }
    
    private func setCornerRadius() {
        //        let maskPAth1 = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: .init(width: self._cornerRadius, height: self._cornerRadius))
        //        let maskLayer1 = CAShapeLayer()
        //        maskLayer1.frame = self.bounds
        //        maskLayer1.path = maskPAth1.cgPath
        //        self.layer.mask = maskLayer1
        self.layer.cornerRadius = self._cornerRadius
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


extension UIView {
    func loadViewFromNib() -> UIView! {
       let bundle = Bundle(for: type(of: self))
       let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
       let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
       
       return view
    }
}
