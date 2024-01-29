//
//  WeSplitView.swift
//  Project01_WeSplit
//
//  Created by 이안진 on 1/29/24.
//

import SwiftUI

struct WeSplitView: View {
    /// 입력 포커스를 관리하는 State
    @FocusState private var amountIsFocused: Bool
    
    /// @State를 통해 값이 변경되면 UI를 다시 로드
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        /// numberOfPeople은 picker의 index로 쓰고 있으므로 2명 추가 필요
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        /// numberOfPeople은 picker의 index로 쓰고 있으므로 2명 추가 필요
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
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
                    /// TextField에 포커스가 되어 있는지 확인
                    .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        /// 처음 할당한 값이 2였는데 왜 기본값이 4 people인가?
                        /// 2, 3, 4, 5, ... 중에 index가 2인 값인 4가 나오는 것!
                        ForEach(2 ..< 100) {
                            /// $0 - closure 사용!
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Tip 을 얼마나 내고 싶으신가요?") {
                    /// 이렇게 Text로 처리할 수 있지만, Section의 이름을 쓰는 것도 가능
                    // Text("Tip 을 얼마나 내고 싶으신가요?")
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ... 100, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                
                Section("Tip 포함 총 금액") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("1인당 금액") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            /// toolbar - navigation bar, bottom, 등등
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    WeSplitView()
}
