//
//  SegmentControl.swift
//  WheatherApp
//
//  Created by Mac on 11/01/23.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var selection: Int
    var body: some View {
        VStack(spacing: 5) {
            //MARK: Segmant Buttons
            HStack{
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                    
                } label: {
                    Text("Weekly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)

            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            //MARK: Separator
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
                .blendMode(.overlay)
                .overlay {
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underlined)
                        .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                }
        }
        .padding(.top, 25)
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(selection: .constant(0))
    }
}
