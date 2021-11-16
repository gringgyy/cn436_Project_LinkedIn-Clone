//
//  Extentions.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 15/11/2564 BE.
//

import SwiftUI
import UIKit
import Kingfisher

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
