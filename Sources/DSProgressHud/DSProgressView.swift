//
//  DSProgressView.swift
//  SettingsApp
//
//  Created by Imran Ali on 16/04/2020.
//  Copyright © 2020 Dreams Solution. All rights reserved.
//

import UIKit

class DSProgressView: UIView {
    
    private var shapeLayer: CAShapeLayer?
    
    override func layoutSubviews() {
        update()
    }
    
    /// Mininum is 0 and maximum 1. 0 means no circle and 1 means full circle
    var circle: CGFloat = 0.8 {
        didSet {
            update()
        }
    }
    /// Increase in lineWidth will increase the thickness of circular line.
    var lineWidth: CGFloat = 2.0 {
        didSet {
            update()
        }
    }
    
    override var frame: CGRect {
        didSet {
            update()
        }
    }
    
    private func update() {
        shapeLayer?.removeFromSuperlayer()
        
        shapeLayer = {
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = bounds
            shapeLayer.lineWidth = lineWidth
            if #available(iOS 13.0, *) {
                shapeLayer.strokeColor = UIColor.label.cgColor
            } else {
                shapeLayer.strokeColor = UIColor.black.cgColor
            }
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)).cgPath
            shapeLayer.strokeStart = 0
            shapeLayer.strokeEnd = circle
            layer.addSublayer(shapeLayer)
            return shapeLayer
        }()
    }
}
