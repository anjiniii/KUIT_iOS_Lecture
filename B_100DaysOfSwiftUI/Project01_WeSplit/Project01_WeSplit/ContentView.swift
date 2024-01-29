//
//  ContentView.swift
//  Project01_WeSplit
//
//  Created by 이안진 on 1/29/24.
//

/// ContentView: 초기 UI가 담겨 있고, 모든 작업이 여기서 시작된다!
/// Assets.scassets: 앱 아이콘, 사진, 색상, iMessage 스티커 등등

/// SwiftUI의 기능을 가지고 온다
import SwiftUI

/// View 프로토콜을 따르고 있는 struct
/// 화면을 그리면 View protocol을 채택해야한다
struct ContentView: View {
    /// View 프로토콜의 필수사항
    var body: some View {
        VStack {
            /// Apple의 SF symbols 에서 가져온 이미지
            Image(systemName: "globe")
                /// 아래는 Image에 적용할 수 있는 method인데
                /// modifier라고 부른다
                /// 추가된 수정사항을 포함한 View가 반환되도록 한다
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            /// 자동으로 여러 줄에 걸쳐 줄바꿈이 이루어진다
            Text("Hello, world!")
        }
        /// modifier
        .padding()
    }
}

/// App Store로 이동할 때, 즉 최종 앱에서는 사용되지 않지만
/// UI 디자인을 할 때, Xcode 내에서 볼 수 있다
/// Preview는 Xcode에 있는 canvas(Editor > Canvas)를 이용하는데, 오른쪽 화면이 바로 그것!
/// 하단에서 customize 할 수 있는데, 실제 앱에는 적용되지 않는다
/// 종종 미리보기가 멈추는 경우가 있는데, 새로 고침을 누르거나 Option + Cmd + P 로 다시 시도할 수 있다
#Preview {
    ContentView()
}
