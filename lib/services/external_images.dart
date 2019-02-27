
const String _urlCloudImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/Fit+food';
const String _urlProductImages = 'https://s3-sa-east-1.amazonaws.com/peddi-service-aws/';

String getCategoryImage(String imageName){
//  return _urlCategoryImages;
  var image = imageName != null ? _urlCloudImages + imageName : "";
  return image;
}

String getProductImage(String imageName){
//  return _urlProductImages;
  var image = imageName != null ? _urlCloudImages + imageName : "";
  return image;
//  if (imageName != null)
//    return _urlCloudImages + imageName;
//  else
//    return "";
}
