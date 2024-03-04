//
//  ContentView.swift
//  WeatherApp
//
//  Created by 이안진 on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("나의 위치")
                    .font(.largeTitle)
                
                Text("포항시")
                
                Text(" 7º")
                    .font(.system(size: 80))
                    .fontWeight(.light)
                
                Text("흐림")
                Text("최고:13º 최저:1º")
            }
            .padding(.vertical, 40)
            
            VStack(alignment: .leading) {
                Text("내일, 더 낮은 기온 및 강우 상태가 예상됩니다.")
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack {
                        VStack(spacing: 8) {
                            Text("지금")
                            Image(systemName: "cloud.fill")
                            Text("7º")
                        }
                        .font(.headline)
                    }
                }
            }
            .padding()
            .background(Color.indigo.opacity(0.5))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
        .background(Color.indigo.opacity(0.3))
    }
}

#Preview {
    ContentView()
}
