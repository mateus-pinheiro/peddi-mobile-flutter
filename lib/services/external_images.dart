
const String _urlCategoryImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/Pratos/DSC_0712.JPG';
const String _urlProductImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/lm09/heineken-longneck.jpg';

String getCategoryImage(String imageName){
  return _urlCategoryImages;
//  return _urlImages + imageName;
}

String getProductImage(String imageName){
  return _urlProductImages;
//  return _urlImages + imageName;
}
