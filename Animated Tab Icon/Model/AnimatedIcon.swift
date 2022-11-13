//
//  AnimatedIcon.swift
//  Animated Tab Icon
//
//  Created by Arunkumar Chandrasekar on 13/11/22.
//

import Foundation
import Lottie

struct AnimatedIcon: Identifiable {
    var id: String = UUID().uuidString
    var tabIcon: Tab
    var lottieView: LottieAnimationView
}
