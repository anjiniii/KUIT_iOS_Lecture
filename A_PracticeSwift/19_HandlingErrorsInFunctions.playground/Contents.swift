import UIKit

enum PasswordError: Error {
    case short, easy
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.easy
    }
    
    if password.count < 10 {
        return "Good"
    } else {
        return "Perfect"
    }
}

let password = "123456789012"

do {
    let result = try checkPassword(password)
    print("결과: \(result)")
} catch PasswordError.easy {
    print("비밀번호가 너무 쉬워요!")
} catch {
    print("비밀번호에 오류가 있습니다.")
}
