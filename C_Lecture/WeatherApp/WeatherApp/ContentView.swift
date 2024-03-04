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
            .background(Color.indigo.opacity(0.6))
            .cornerRadius(12)
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "calendar")
                    Text("10일간의 일기예보")
                }
                .opacity(0.4)
                
                ForEach(0 ..< 10, id: \.self) { _ in
                    Divider()
                    
                    VStack {
                        HStack {
                            Text("오늘")
                            Spacer()
                            Image(systemName: "cloud.fill")
                            Spacer()
                            Text("1º")
                                .opacity(0.5)
                            Rectangle()
                                .frame(width: 100, height: 6)
                                .cornerRadius(100)
                            Text("13º")
                        }
                    }
                }
            }
            .padding()
            .background(Color.indigo.opacity(0.6))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.never)
        .foregroundStyle(Color.white)
        .background(Color.indigo.opacity(0.4))
    }
}

#Preview {
    ContentView()
}
