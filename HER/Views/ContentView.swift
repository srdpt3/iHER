import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        
        Group{
            if viewModel.userSession != nil {
                MainView().environmentObject(viewModel)

            }else{
                LoginView()
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
