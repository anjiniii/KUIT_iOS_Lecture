//
//  ForEachView.swift
//  Project01_WeSplit
//
//  Created by 이안진 on 1/29/24.
//

import SwiftUI

struct ForEachView: View {
    /// 배열은 상수이므로 @State를 표시하지 않는다. 변하지 않을 거니까!
    let students = ["안진", "가은", "아현"]
    /// "안진"으로 시작하고, 변경될 수 있으므로 @State를 표시!
    @State private var selectedStudent = "안진"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    /// id: \.self 는 SwiftUI가 모든 View를 고유하게 식별하고
                    /// 변경을 감지하기 위해 필요한 부분이다!
                    /// 문자열 자체가 고유하므로 id를 self로 두는 것!
                    /// 중복되면 문제가 있을 수 있음
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ForEachView()
}
