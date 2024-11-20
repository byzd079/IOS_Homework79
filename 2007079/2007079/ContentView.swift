import SwiftUI

struct ContentView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmi: String = ""
    @State private var bmiCategory: String = ""

    var body: some View {
        ZStack {
            // Background Image
            
            
            VStack() {
                // Title
                Text("BMI Calculator")
                    
                
                Spacer()
                
                // Input Fields
                VStack() {
                    HStack {
                        Text("Height (cm):")
                           
                        Spacer()
                        TextField("Enter your height", text: $height)
                          
                    }
                    
                    HStack {
                        Text("Weight (kg):")
                            
                        Spacer()
                        TextField("Enter your weight", text: $weight)
                           
                    }
                }
                .padding(.horizontal, 30)
                
                // Calculate Button
                Button(action: calculateBMI) {
                    Text("Calculate")
                        .font(.headline)
                        .foregroundStyle(.white)
                        
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                // Display BMI and Category
                if !bmi.isEmpty {
                    VStack(spacing: 10) {
                        Text("Your BMI: \(bmi)")
                            .font(.title)

                        
                        Text("Category: \(bmiCategory)")
                            .font(.headline)
                         
                    }
                }
                
                Spacer()
                
                // Footer Image
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                
                Spacer()
            }
            .padding()
        }
    }
    
    // BMI Calculation Logic
    func calculateBMI() {
        guard let heightValue = Double(height), let weightValue = Double(weight) else {
            bmi = "Invalid input"
            bmiCategory = "N/A"
            return
        }
        
        let heightInMeters = heightValue / 100
        let bmiValue = weightValue / (heightInMeters * heightInMeters)
        bmi = String(format: "%.2f", bmiValue)
        
        switch bmiValue {
        case ..<18.5:
            bmiCategory = "Underweight"
        case 18.5..<24.9:
            bmiCategory = "Normal"
        case 25..<29.9:
            bmiCategory = "Overweight"
        default:
            bmiCategory = "Obese"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
