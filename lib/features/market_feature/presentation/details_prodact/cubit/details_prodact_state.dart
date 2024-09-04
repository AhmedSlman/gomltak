abstract class DetailsProdactState {
  const DetailsProdactState();
}

class DetailsProdactInitial extends DetailsProdactState {}

class DetailsProdactError extends DetailsProdactState {
  DetailsProdactError(this.errMassage);
  final String errMassage;
}

class DetailsProdactSuccess extends DetailsProdactState {}

class DetailsProdactLoding extends DetailsProdactState {}

class DetailsProdactCountLoding extends DetailsProdactState {}

class DetailsProdactCountlodid extends DetailsProdactState {}
