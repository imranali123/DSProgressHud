//
//  DSGradientProgressView.swift
//  SettingsApp
//
//  Created by Imran Ali on 16/04/2020.
//  Copyright © 2020 Dreams Solution. All rights reserved.
//

import UIKit

class DSGradientProgressView: UIView {

    private var gradientLayer: CAGradientLayer?
    
    /// No of segments (Gradient colors) in the circle
    var segments: Int = 5 {
        didSet {
            draw()
        }
    }
    
    var colors: [CGColor]? {
        didSet {
            draw()
        }
    }
    
    var lineWidth: CGFloat = 2 {
        didSet {
            draw()
        }
    }
    
    override var frame: CGRect {
        didSet {
            draw()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.draw()
    }
    
    func draw() {
        gradientLayer?.removeFromSuperlayer()
        
        if colors == nil {
            colors = {
               var colors = [CGColor]()
                for index in 0..<segments {
                    let color = UIColor(hue: CGFloat(index) / CGFloat(segments), saturation: 1, brightness: 1, alpha: 1)
                    colors.append(color.cgColor)
                }
                return colors
            }()
        }
        
        
        gradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            if #available(iOS 12.0, *) {
                gradientLayer.type = .conic
            }
            gradientLayer.colors = colors
            gradientLayer.frame = bounds
            layer.addSublayer(gradientLayer)
            
            gradientLayer.mask = {
                let shapeLayer = CAShapeLayer()
                shapeLayer.frame = bounds
                shapeLayer.strokeColor = UIColor.blue.cgColor
                shapeLayer.lineWidth = lineWidth
                shapeLayer.fillColor = UIColor.clear.cgColor
                shapeLayer.path = UIBezierPath(ovalIn: bounds.inset(by: UIEdgeInsets(top: lineWidth*0.5, left: lineWidth*0.5, bottom: lineWidth*0.5, right: lineWidth*0.5))).cgPath
                return shapeLayer
            }()
            
            
            return gradientLayer
        }()
    }

}
