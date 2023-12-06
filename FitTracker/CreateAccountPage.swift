import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var birthday = Date()
    @State private var selectedActivityIndex = 0
    private let activityRangeOptions = ["Normie", "Chubs", "Swole"]

    var body: some View {
        ZStack {
            PolygonBackground()

            VStack(alignment: .leading, spacing: 16) {
                Text("Create Account")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 40)

                Text("Complete the Following:")
                    .font(.headline)
                    .foregroundColor(.white)

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                VStack(alignment: .leading, spacing: 8) {
                    Text("Birthday:")
                        .font(.headline)
                        .foregroundColor(.white)

                    DatePicker("", selection: $birthday, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .foregroundColor(.white)
                }

                Text("Select Your Current Body Type:")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Picker("Activity Range", selection: $selectedActivityIndex) {
                    ForEach(Array(0..<activityRangeOptions.count), id: \.self) { index in
                        Text(self.activityRangeOptions[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())


                Button(action: {
                    // Handle account creation logic here
                    print("Create account logic goes here")
                }) {
                    Text("Create Account")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .padding(20)
            .navigationBarTitle("", displayMode: .inline)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PolygonBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }
            .fill(LinearGradient(
                gradient: Gradient(colors: [.red, .blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
