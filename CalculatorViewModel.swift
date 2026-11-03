import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    private var expression = ""
    
    func input(_ value: String) {
        var val = value
        if val == "," { val = "." }
        if val == "÷" { val = "/" }
        if val == "×" { val = "*" }
        
        expression += val
        display = expression.replacingOccurrences(of: ".", with: ",")
    }
    
    func clear() {
        expression = ""
        display = "0"
    }
    
    func backspace() {
        if !expression.isEmpty {
            expression.removeLast()
            display = expression.isEmpty ? "0" : expression
        }
    }
    
    func calculate() {
        let exp = NSExpression(format: expression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            // Formata igual iOS 18
            if result.doubleValue.truncatingRemainder(dividingBy: 1) == 0 {
                display = "\(result.intValue)"
            } else {
                display = "\(result)".replacingOccurrences(of: ".", with: ",")
            }
            expression = "\(result)"
        }
    }
}
