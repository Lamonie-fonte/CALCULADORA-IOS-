import SwiftUI

struct CalculatorView: View {
    @StateObject var vm = CalculatorViewModel()
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 4)
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(vm.display)
                        .font(.system(size: 80, weight: .light))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 24)
                }
                
                LazyVGrid(columns: columns, spacing: 12) {
                    Button(action: { vm.backspace() }) { KeyView("⌫", color: .gray) }
                    Button(action: { vm.clear() }) { KeyView("AC", color: .gray) }
                    Button(action: { vm.input("%") }) { KeyView("%", color: .gray) }
                    Button(action: { vm.input("÷") }) { KeyView("÷", color: .orange) }
                    
                    Button(action: { vm.input("7") }) { KeyView("7") }
                    Button(action: { vm.input("8") }) { KeyView("8") }
                    Button(action: { vm.input("9") }) { KeyView("9") }
                    Button(action: { vm.input("×") }) { KeyView("×", color: .orange) }
                    
                    Button(action: { vm.input("4") }) { KeyView("4") }
                    Button(action: { vm.input("5") }) { KeyView("5") }
                    Button(action: { vm.input("6") }) { KeyView("6") }
                    Button(action: { vm.input("-") }) { KeyView("-", color: .orange) }
                    
                    Button(action: { vm.input("1") }) { KeyView("1") }
                    Button(action: { vm.input("2") }) { KeyView("2") }
                    Button(action: { vm.input("3") }) { KeyView("3") }
                    Button(action: { vm.input("+") }) { KeyView("+", color: .orange) }
                    
                    Button(action: { vm.input("+/-") }) { KeyView("+/-") }
                    Button(action: { vm.input("0") }) { KeyView("0") }
                    Button(action: { vm.input(",") }) { KeyView(",") }
                    Button(action: { vm.calculate() }) { KeyView("=", color: .orange) }
                }
                .padding()
            }
        }
    }
}

struct KeyView: View {
    var text: String
    var color: Color = Color(.darkGray)
    init(_ text: String, color: Color = Color(white: 0.2)) {
        self.text = text
        self.color = color
    }
    var body: some View {
        Text(text)
            .font(.system(size: 32, weight: .regular))
            .frame(width: 75, height: 75)
            .background(color)
            .foregroundColor(color == .gray ? .black : .white)
            .clipShape(Circle())
    }
}
