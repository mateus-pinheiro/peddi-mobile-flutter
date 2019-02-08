
const String _urlCategoryImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/';
const String _urlProductImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/';

String getCategoryImage(String imageName){
//  return _urlCategoryImages;
  return _urlCategoryImages + imageName;
}

String getProductImage(String imageName){
//  return _urlProductImages;
  if (imageName != null)
    return _urlProductImages + imageName;

  return "";
}
