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
                    HStack(spacing: 20) {
                        VStack(spacing: 8) {
                            Text("지금")
                            Image(systemName: "cloud.fill")
                            Text("7º")
                        }
                        .font(.system(size: 16))
                        
                        ForEach(1 ..< 12, id: \.self) { index in
                            TimeWeatherInfo(time: index)
                        }
                    }
                }
                .scrollIndicators(.never)
            }
            .padding()
            .background(Color.indigo.opacity(0.5))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
        .background(Color.indigo.opacity(0.3))
    }
}

struct TimeWeatherInfo: View {
    let time: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text("오전 \(time)시")
            Image(systemName: "cloud.fill")
            Text("7º")
        }
        .font(.system(size: 16))
    }
}

#Preview {
    ContentView()
}
