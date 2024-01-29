//
//  WeSplitView.swift
//  Project01_WeSplit
//
//  Created by 이안진 on 1/29/24.
//

import SwiftUI

struct WeSplitView: View {
    /// @State를 통해 값이 변경되면 UI를 다시 로드
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        Form {
            Section {
                /// 오류: Cannot convert value of type 'Binding<Double>' to expected argument type 'Binding<String>'
                /// 문자열을 받아야하는데 Double을 받고 있다!!
                // TextField("Amount", text: $checkAmount)
                
                /// USD로 강제하면.. 안된다...
                // TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                
                /// 사용자의 지역의 통화 코드가 있는지 확인 후, 없으면 USD
                /// Locale에서 달력, 숫자 구분 방식, 미터법 사용 여부 등등
                /// 사용자 지역의 설정을 불러올 수 있다
                TextField("Amount", value: $checkAmount,
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    /// 들여쓰기를 통해 어떤 View에 적용하는지 명시할 수 있다
                    /// 하드웨어 키보드가 있다면, 숫자 이외에도 입력될 수 있지만
                    /// return 키를 누르면 자동 필터링 된다
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}

#Preview {
    WeSplitView()
}
