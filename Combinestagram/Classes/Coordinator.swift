import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  @ObservedObject var viewModel: ViewModel

  @Binding var isCoordinatorShown: Bool
  @Binding var imageInCoordinator: UIImage?

  init(viewModel: ViewModel, isShown: Binding<Bool>, image: Binding<UIImage?>) {
    self.viewModel = viewModel
    _isCoordinatorShown = isShown
    _imageInCoordinator = image
  }

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      return
    }
    imageInCoordinator = unwrapImage
    isCoordinatorShown = false

    if let image = imageInCoordinator {
      self.viewModel.images.append(image)
    }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    isCoordinatorShown = false
  }
}
