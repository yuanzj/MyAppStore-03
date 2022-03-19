//
//  TodayView.swift
//  AppStore
//
//  Created by 袁志健 on 2022/3/6.
//

import SwiftUI

struct TodayView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    @Binding var selectedId: UUID
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(spacing: 30) {
                if !show {
                    ForEach(appList) { appInfo in
                        AppCardView(appInfo: appInfo, namespace: namespace, show: $show , selectedId: $selectedId)
                    }
                } else {
                    ForEach(appList) { appInfo in
                        
                        placeholder
                        
                    }
                }
            }.padding(.vertical, 20.0)
        }
        
    }
    
    var placeholder: some View {
        VStack(alignment: .leading, spacing: 0) {}
        .frame(width: UIScreen.main.bounds.width - 40, height: (UIScreen.main.bounds.width - 40)  / 4.0 * 3 + 100)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10))
        .padding(.horizontal, 20)
    }
}

struct TodayView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        TodayView(namespace: namespace, show: .constant(false), selectedId: .constant(UUID()))
            .previewDevice("iPhone 12 mini")
    }
}
