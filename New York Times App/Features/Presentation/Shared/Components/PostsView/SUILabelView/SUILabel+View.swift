//
//  SUILabel+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 3/7/22.
//

import SwiftUI

enum LabelPosition {
    case left, right
}

struct SUILabelViewModel {
    let text: String
    let position: LabelPosition
    let font: Font
    let color: Color? = Color.primaryTextColor
    let isWithOpacity: Bool?
}

struct SUILabelView: View {
    let model: SUILabelViewModel
    
    var body: some View {
        HStack {
            switch model.position {
                case .left:
                    Text(model.text)
                        .font(model.font)
                        .foregroundColor(model.color)
                        .opacity(model.isWithOpacity ?? false ? 0.5 : 1)
                        .padding(.horizontal)
                    Spacer()
                case .right:
                    Spacer()
                    Text(model.text)
                        .font(model.font)
                        .foregroundColor(model.color)
                        .opacity(model.isWithOpacity ?? false ? 0.5 : 1)
                        .padding(.horizontal)
            }
        }
    }
}


