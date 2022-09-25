class EndPoints {
  static const String baseUrl = 'https://lavie.orangedigitalcenteregypt.com';
  static const String signUp = '$baseUrl/api/v1/auth/signup';
  static const String signIn = '$baseUrl/api/v1/auth/signin';
  static const String getMe = '$baseUrl/api/v1/user/me';
  static const String blogs = '$baseUrl/api/v1/products/blogs';
  static const String getAllProducst = '$baseUrl/api/v1/products';
  static const String getAllForums = '$baseUrl/api/v1/forums';
  static const String getMeForums = '$baseUrl/api/v1/forums/me';
  static const String getUserById = '$baseUrl/api/v1/user/reciepts/recieptId';
  static const String updateMyData = '$baseUrl/api/v1/user/me';
  static const String createPost = '$baseUrl/api/v1/forums';
  static const String signInWithGoogle = '$baseUrl/api/v1/auth/google';
}
