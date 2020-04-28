import SwiftUI
import UIKit
import Combine

struct ContentView: View {

  @ObservedObject var viewModel = ViewModel()

  let width = UIScreen.main.bounds.width

  @State var image: UIImage? = nil
  @State var showCaptureImageView: Bool = false

  @State private var showAlert: Bool = false

  var alert: Alert {
    let title: String = self.viewModel.alertTitle()
    let message: String = self.viewModel.alertMessage()
    return Alert(
      title: Text(title),
      message: Text(message),
      dismissButton: .default(Text("Dismiss"))
    )
  }

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        Rectangle()
          .stroke(Color.gray)
          .frame(
            width: (self.width * 0.9),
            height: (self.width * 0.9),
            alignment: .center
          )
          .overlay(
            self.viewModel.collage?
              .resizable()
              .frame(
                width: (self.width * 0.9),
                height: (self.width * 0.9),
                alignment: .center
              )
          ).onAppear(perform: {
            self.viewModel.updateImage()
          })
        Spacer()
        HStack {
          Spacer()
          Button(action: {
            self.viewModel.clear()
            self.image = nil
          }) {
            Text("clear")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(Color.red)
          }
          Spacer()
          Button(action: {
            self.viewModel.save()
            self.showAlert.toggle()
            self.viewModel.clear()
            self.image = nil
          }) {
            Text("save")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(Color.green)
          }
          Spacer()
        }
        Spacer()
      }
        .navigationBarTitle(self.viewModel.displayTitle())
        .navigationBarItems(trailing:
        NavigationLink(destination: AddPhotos(
          viewModel: self.viewModel,
          isShown: $showCaptureImageView,
          image: $image
        )
          .navigationBarTitle("camera roll")
        ) {
          Text("+")
            .font(.largeTitle)
            .fontWeight(.bold)
        }
        )
    }.alert(isPresented: $showAlert, content: { self.alert })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
