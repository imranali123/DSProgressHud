//
//  DSGradientProgressHid.swift
//  SettingsApp
//
//  Created by Imran Ali on 16/04/2020.
//  Copyright © 2020 Dreams Solution. All rights reserved.
//

import UIKit

public class DSGradientProgressHud: UIView {

    private var progressView: DSGradientProgressView?
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        progressView?.center = self.center
    }
    
    public init(frame: CGRect, view: UIView) {
        
        super.init(frame: frame)
    
        self.autoresizingMask = .init(arrayLiteral: .flexibleWidth, .flexibleHeight)
        
        let width = min(bounds.size.width, bounds.size.height) / 4.0
        
        progressView = DSGradientProgressView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: width)))
        self.addSubview(progressView!)
        progressView?.center = self.center
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        var angle: CGFloat = 0.0
        if #available(iOS 12.0, *) {
            Timer.scheduledTimer(withTimeInterval: 1.0/60.0, repeats: true, block: { [weak self] _ in
                angle += 0.06
                self?.progressView?.transform = CGAffineTransform(rotationAngle: angle)
            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public class func showhud(to view: UIView) {
        let overlay = DSGradientProgressHud(frame: view.bounds, view: view)
        view.addSubview(overlay)
    }
    
    public class func hideHud(for view: UIView) {
        view.subviews.reversed().forEach { (subView) in
            if subView is DSGradientProgressHud {
                subView.removeFromSuperview()
                return
            }
        }
    }
    
    public class func hideAllHud(for view: UIView) {
        view.subviews.forEach { (subView) in
            if subView is DSGradientProgressHud {
                subView.removeFromSuperview()
            }
        }
    }

}
