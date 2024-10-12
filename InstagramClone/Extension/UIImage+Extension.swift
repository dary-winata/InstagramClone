//
//  UIImage+Extension.swift
//  InstagramClone
//
//  Created by dary winata nugraha djati on 12/10/24.
//

import UIKit

extension UIImage {
    func resizeImage(width newWidth: CGFloat) -> UIImage {
        guard self.size.width != newWidth else { return self }
        
        let scaleFactor = newWidth / self.size.width
        let newHeight = self.size.height * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? self
    }
}
