enum RequestState {
  idle,
  loading,
  loginloaded,
  cachedSuccess,
  error,
}

enum AllProductsRequestState {
  idle,
  accessTokenGetSuccess,
  userDataGetSuccess,
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
  loaded,
  error,
}
