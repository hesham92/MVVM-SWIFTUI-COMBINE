//
//  UIDevice.swift
//  Tiqan
//
//  Created by Murad Jamal on 08/02/2020.
//  Copyright © 2020 Saudi Council of Engineers. All rights reserved.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            let bottom = keyWindow.safeAreaInsets.bottom
            return bottom > 0
        }
        return false
    }
}

