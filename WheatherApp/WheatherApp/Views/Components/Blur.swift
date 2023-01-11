//
//  Blur.swift
//  WheatherApp
//
//  Created by Mac on 10/01/23.
//

import SwiftUI

class UIBackDropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackDropLayer") ?? CALayer.self
    }
}
struct BackDrop: UIViewRepresentable {
    func makeUIView(context: Context) -> UIBackDropView {
        UIBackDropView()
    }
    
    func updateUIView(_ uiView: UIBackDropView, context: Context) {
        
    }
}
struct Blur: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    var body: some View {
       BackDrop()
            .blur(radius: radius, opaque: opaque)
        
    }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
