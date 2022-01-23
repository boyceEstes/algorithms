import SwiftUI
import PlaygroundSupport
// https://www.hackerrank.com/challenges/magic-square-forming/problem


class UserViewModel: ObservableObject {
    // input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    // output
    @Published var isValid: Bool = false
}


struct ContentView: View {
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $userViewModel.username)
            }
            Section {
                TextField("Password", text: $userViewModel.password)
                TextField("Password again", text: $userViewModel.passwordAgain)
            }
            Section {
                Button("Register") {
                    print("Register was clicked")
                }.disabled(!userViewModel.isValid)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
