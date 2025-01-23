import 'package:figure_toys/models/product_model.dart';

// class ProductData {
//   final menu = <Product>[
//     Product(title: 'Sản phẩm 1' , minimumOrderQuantity: 1,description:
//         """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sagittis enim quis lectus condimentum, vel bibendum ipsum malesuada. Maecenas tempus est nec pharetra dapibus. Sed vitae efficitur sem. Proin molestie orci erat, a vehicula erat pulvinar vitae. Morbi sagittis est sit amet elit porta, bibendum sagittis nunc bibendum. Quisque mattis pharetra magna ut posuere. Cras convallis tincidunt velit vitae tincidunt. Ut quis orci vitae nunc sollicitudin efficitur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac tellus vitae orci facilisis mollis sit amet eleifend turpis. Curabitur tempus massa elit, a placerat quam sollicitudin eu.
//
// Integer porta lectus lacus, vitae aliquam mi laoreet vel. Morbi sapien enim, maximus a odio sed, lacinia vehicula est. Aliquam justo diam, congue id libero in, dictum interdum sapien. Sed feugiat, augue sed vulputate rhoncus, velit nisl gravida lacus, et molestie justo erat sed quam. Vestibulum vestibulum auctor tortor non aliquet. Maecenas nec mi dignissim, gravida dolor id, pellentesque libero. Aliquam eu malesuada enim, ac tincidunt tortor. Phasellus pulvinar, massa non congue fermentum, ante quam tristique ante, ut lacinia ex erat viverra neque.
//
// Duis scelerisque sit amet diam sed laoreet. Aliquam eget justo nec nulla aliquam volutpat id ut velit. Praesent at mauris tincidunt risus congue aliquet. Sed sed ullamcorper tellus. Quisque vitae viverra mauris. Vivamus vitae ipsum id ex lacinia sodales. Proin a diam neque. Duis aliquam, nisi lacinia laoreet lobortis, velit augue vehicula ipsum, sagittis rutrum ipsum erat sit amet dui.
//
// Cras nec risus interdum, scelerisque nisl id, vulputate magna. Cras consectetur tellus eget nisl varius, non porta dolor viverra. Nulla ut elit sit amet enim malesuada faucibus et at augue. Aliquam convallis porta erat nec interdum. Etiam aliquet mi vel convallis tempor. Duis ullamcorper lectus quis turpis tempus pellentesque. Aenean id metus tortor. Integer quis tincidunt felis. Maecenas varius euismod aliquam. Vivamus varius ultrices scelerisque.
//
// Cras et porta lorem. Nam nibh ligula, interdum non fringilla ac, consequat sed lacus. Nunc ultrices mi at laoreet lacinia. Mauris quis justo eget elit ullamcorper sollicitudin. Sed imperdiet neque dui, eget dignissim sapien porttitor nec. Ut euismod lectus ut sem gravida, sit amet condimentum mi sodales. Praesent in convallis eros, sit amet iaculis massa. Aliquam erat volutpat. Morbi accumsan magna nec porttitor ornare. Donec malesuada pulvinar nibh quis suscipit. Nulla et leo malesuada, rutrum dolor nec, mattis massa. Etiam pretium a mi a imperdiet. Ut maximus metus in erat dapibus, vel semper lacus ultrices. Curabitur non massa tristique neque commodo molestie. Fusce hendrerit facilisis odio, at tincidunt dolor porttitor eget."""
//         , thumbnail: 'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg', price: 1000.0),
//
//   ];
//
// }

class ProductData {
  final menu = List<Product>.generate(100, (int index)  {
    return Product(name: 'San pham $index', thumbnail: 'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg', descriptionSale: """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sagittis enim quis lectus condimentum, vel bibendum ipsum malesuada. Maecenas tempus est nec pharetra dapibus. Sed vitae efficitur sem. Proin molestie orci erat, a vehicula erat pulvinar vitae. Morbi sagittis est sit amet elit porta, bibendum sagittis nunc bibendum. Quisque mattis pharetra magna ut posuere. Cras convallis tincidunt velit vitae tincidunt. Ut quis orci vitae nunc sollicitudin efficitur. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac tellus vitae orci facilisis mollis sit amet eleifend turpis. Curabitur tempus massa elit, a placerat quam sollicitudin eu.

Integer porta lectus lacus, vitae aliquam mi laoreet vel. Morbi sapien enim, maximus a odio sed, lacinia vehicula est. Aliquam justo diam, congue id libero in, dictum interdum sapien. Sed feugiat, augue sed vulputate rhoncus, velit nisl gravida lacus, et molestie justo erat sed quam. Vestibulum vestibulum auctor tortor non aliquet. Maecenas nec mi dignissim, gravida dolor id, pellentesque libero. Aliquam eu malesuada enim, ac tincidunt tortor. Phasellus pulvinar, massa non congue fermentum, ante quam tristique ante, ut lacinia ex erat viverra neque.

Duis scelerisque sit amet diam sed laoreet. Aliquam eget justo nec nulla aliquam volutpat id ut velit. Praesent at mauris tincidunt risus congue aliquet. Sed sed ullamcorper tellus. Quisque vitae viverra mauris. Vivamus vitae ipsum id ex lacinia sodales. Proin a diam neque. Duis aliquam, nisi lacinia laoreet lobortis, velit augue vehicula ipsum, sagittis rutrum ipsum erat sit amet dui.

Cras nec risus interdum, scelerisque nisl id, vulputate magna. Cras consectetur tellus eget nisl varius, non porta dolor viverra. Nulla ut elit sit amet enim malesuada faucibus et at augue. Aliquam convallis porta erat nec interdum. Etiam aliquet mi vel convallis tempor. Duis ullamcorper lectus quis turpis tempus pellentesque. Aenean id metus tortor. Integer quis tincidunt felis. Maecenas varius euismod aliquam. Vivamus varius ultrices scelerisque.

Cras et porta lorem. Nam nibh ligula, interdum non fringilla ac, consequat sed lacus. Nunc ultrices mi at laoreet lacinia. Mauris quis justo eget elit ullamcorper sollicitudin. Sed imperdiet neque dui, eget dignissim sapien porttitor nec. Ut euismod lectus ut sem gravida, sit amet condimentum mi sodales. Praesent in convallis eros, sit amet iaculis massa. Aliquam erat volutpat. Morbi accumsan magna nec porttitor ornare. Donec malesuada pulvinar nibh quis suscipit. Nulla et leo malesuada, rutrum dolor nec, mattis massa. Etiam pretium a mi a imperdiet. Ut maximus metus in erat dapibus, vel semper lacus ultrices. Curabitur non massa tristique neque commodo molestie. Fusce hendrerit facilisis odio, at tincidunt dolor porttitor eget.
    """ , price: 100000000.0, id: index + 1);
  });
}