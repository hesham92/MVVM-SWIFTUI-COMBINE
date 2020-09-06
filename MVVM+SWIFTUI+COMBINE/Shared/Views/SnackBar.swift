//
//  SnackBar.swift
//  Tiqan
//
//  Created by Murad Jamal on 06/02/2020.
//  Copyright © 2020 Saudi Council of Engineers. All rights reserved.
//

import Foundation
import SwiftUI

struct SnackBarInfo {
    var title: String
    var detail: String
    var type: SnackBarType
    var dismissAfter: DispatchTime
    
    
    init(title: String, type: SnackBarType, detail: String = "",
         dismissAfter: DispatchTime = .now() + 3.5) {
        self.title = title
        self.type = type
        self.detail = detail
        self.dismissAfter = dismissAfter
    }
}

enum SnackBarType {
    case info
    case warning
    case success
    case error
    
    var tintColor: Color {
        switch self {
        case .info:
            return Color(red: 67/255, green: 154/255, blue: 215/255)
        case .success:
            return Color.green
        case .warning:
            return Color.yellow
        case .error:
            return Color.red
        }
    }
    
    var icon: String {
        switch self {
        case .info:
            return "infoIcon"
        case .success:
            return "successIcon"
        case .warning:
            return "warningIcon"
        case .error:
            return "errorIcon"
        }
    }
}

struct SnackBarModifier: ViewModifier {
    var data: SnackBarInfo
    @Binding var show: Bool
    @State var task: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        
        ZStack {
         if show {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(data.title)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 4)
                            
                            Text(data.detail)
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }.frame(minHeight: 60)
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(data.type.tintColor)
                    .cornerRadius(8)
                    Spacer()
                }.frame(maxWidth: UIScreen.main.bounds.width - 40) //using geometry reader here gives in correct size (I don't know why)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.show = false
                        }
                    }
                })
            }
            content
        }
        
    }
}

extension View {
    func snackBar(data: SnackBarInfo, show: Binding<Bool>) -> some View {
        self.modifier(SnackBarModifier(data: data, show: show))
    }
}
