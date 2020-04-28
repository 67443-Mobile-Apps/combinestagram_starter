import SwiftUI
import UIKit

struct AddPhotos {

  @ObservedObject var viewModel: ViewModel

  @Binding var isShown: Bool
  @Binding var image: UIImage?

  func makeCoordinator() -> Coordinator {
    return Coordinator(viewModel: self.viewModel, isShown: $isShown, image: $image)
  }
}

extension AddPhotos: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<AddPhotos>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<AddPhotos>) {
  }
}
