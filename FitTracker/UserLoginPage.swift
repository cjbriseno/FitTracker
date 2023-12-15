import SwiftUI

struct UserLoginPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                ZStack {
                    Circle()
                        .foregroundColor(Color(red: 160/255, green: 11/255, blue: 32/255))
                        .frame(width: 300, height: 300)
                        .position(x: 100, y: 40)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.white)
                    
                    Text("FitTracker")
                        .font(.system(.largeTitle, design: .monospaced))
                        .fontWeight(.semibold)
                }
                
                Text("Welcome!")
                    .font(.system(.largeTitle, design: .monospaced))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Login")
                    .font(.system(.largeTitle, design: .monospaced))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 50.0)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(red: 160/255, green: 11/255, blue: 32/255)))
                    .padding(.bottom, 10)
                
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color(red: 160/255, green: 11/255, blue: 32/255)))
                    .padding(.top, 10)
                    .padding(.bottom, 40)
                
                Button(action: {}) {
                    Text("Sign In")
                        .font(.system(.title, design: .monospaced))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50)
                }
                .background(Color(red: 160/255, green: 11/255, blue: 32/255))
                .cornerRadius(50)
                .padding(.bottom, 75)
                
                //removed Forgot Password? link
//                NavigationLink(destination: CreateAccountPage()) {
//                    Text("Forgot Password?")
//                        .font(.system(.body, design: .monospaced))
//                        .padding(.bottom, 30)
//                        .underline()
//                }
                
                NavigationLink(destination: CreateAccountPage()) {
                    Text("Create Account")
                        .font(.system(.body, design: .monospaced))
                        .underline()
                }
            }
            .padding()
        }
    }
}

struct UserLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginPage()
    }
}
