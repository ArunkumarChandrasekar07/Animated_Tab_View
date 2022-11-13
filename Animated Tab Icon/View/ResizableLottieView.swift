//
//  ResizableLottieView.swift
//  Animated Tab Icon
//
//  Created by Arunkumar Chandrasekar on 13/11/22.
//

import SwiftUI
import Lottie

struct ResizableLottieView: UIViewRepresentable {
    
    var lottieView: LottieAnimationView
    var color: SwiftUI.Color = .red
    
    func makeUIView(context: Context) -> UIView {
        let view: UIView = UIView()
        view.backgroundColor = .clear
        addLottieView(to: view)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let animationView = uiView.subviews.first(where: { view in
            view is LottieAnimationView
        }) as? LottieAnimationView {
//            lottieView.logHierarchyKeypaths()
            let lottieColor = ColorValueProvider(UIColor(color).lottieColorValue)
            let fillKeyPath = AnimationKeypath(keys: ["**", "Fill 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: fillKeyPath)
            
            let strokeKeyPath = AnimationKeypath(keys: ["**", "Stroke 1", "**", "Color"])
            animationView.setValueProvider(lottieColor, keypath: strokeKeyPath)
        }
    }
    
    func addLottieView(to: UIView) {
        lottieView.backgroundBehavior = .forceFinish
        lottieView.shouldRasterizeWhenIdle = true
        
        lottieView.backgroundColor = .clear
        lottieView.contentMode = .scaleAspectFit
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
