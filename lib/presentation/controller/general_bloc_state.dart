class GeneralBlocState<T>{
  T? data;
  String? error;
  bool hasData , hasError,waiting ;

  GeneralBlocState(
      {this.data, this.error, this.hasData=false, this.hasError=false, this.waiting=false});
}