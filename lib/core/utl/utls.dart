enum RequestState {
  idle,
  loading,
  loginloaded,
  cachedSuccess,
  error,
}

enum AllProductsRequestState {
  idle,
  loading,
  loaded,
  error,
}

enum BlogsRequestState {
  loading,
  loaded,
  error,
}

enum ForumsRequestState {
  loading,
  loaded,
  error,
}

enum ForumsPostRequestState {
  idle,
  loading,
  posted,
  error,
}

enum ImagePickeRequestState {
  loading,
  picked,
  error,
}

enum CartRequestState {
  loading,
  loaded,
  insertedSuccessfully,
  deletedSuccessfully,
  error,
}

enum UpdateUserDataRequestState {
  idle,
  loading,
  updatedSuccessfully,
  error,
}

enum UserDataRequestState {
  loading,
  accessTokenGetSuccess,
  loaded,
  error,
}

enum InternetConnectionState {
  connected,
  disconnected,
}

enum ProductDetailsRequestState {
  loading,
  loaded,
  error,
}

enum ProductDetailsType {
  plant,
  seed,
  tool,
}

enum SearchForumRequestState {
  loading,
  loaded,
  error,
}
