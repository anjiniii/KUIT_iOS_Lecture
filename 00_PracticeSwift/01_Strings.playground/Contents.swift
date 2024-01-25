import UIKit

let name = "anjin 🐥"

let introduction = "안녕하세요 제 이름은 \"안진\"입니다."

/// 여러 줄이면 3개의 큰따옴표를!
let movie = """
A day in
the life of an
Apple engineer
"""

/// String의 글자수
print(name.count)

/// String 앞에 해당 문자열로 시작하는지
print(introduction.hasPrefix("안녕"))
/// String 뒤에 해당 문자열로 끝나는지
/// 대문자와 소문자 구분 O
print(movie.hasSuffix("Engineer"))
