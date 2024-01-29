//
//  FormView.swift
//  Project01_WeSplit
//
//  Created by 이안진 on 1/29/24.
//

import SwiftUI

struct FormView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    FormView()
}
