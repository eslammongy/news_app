abstract class NewsStatus {}

class InitialStatus extends NewsStatus {}

class BottomBarStatus extends NewsStatus {}

class LoadingBusinessNewsDate extends NewsStatus {}

class StateOfSuccessgetBusinessNew extends NewsStatus {}

class StateOfErrorgetBusinessNew extends NewsStatus {
  final String error;
  StateOfErrorgetBusinessNew(this.error);
}

class LoadingSportsNewsDate extends NewsStatus {}

class StateOfSuccessgetSportsNew extends NewsStatus {}

class StateOfErrorgetSportsNew extends NewsStatus {
  final String error;
  StateOfErrorgetSportsNew(this.error);
}

class LoadingScienceNewsDate extends NewsStatus {}

class StateOfSuccessgetScienceNew extends NewsStatus {}

class StateOfErrorgetScienceNew extends NewsStatus {
  final String error;
  StateOfErrorgetScienceNew(this.error);
}

class LoadingSearchNewsDate extends NewsStatus {}

class StateOfSuccessgetSearchNew extends NewsStatus {}

class StateOfErrorgetSearchNew extends NewsStatus {
  final String error;
  StateOfErrorgetSearchNew(this.error);
}

class LoadingHealthNewsDate extends NewsStatus {}

class StateOfSuccessgetHealthNew extends NewsStatus {}

class StateOfErrorgetHealthNew extends NewsStatus {
  final String error;
  StateOfErrorgetHealthNew(this.error);
}

class LoadingSourseNewsDate extends NewsStatus {}

class StateOfSuccesSourseNew extends NewsStatus {}

class StateOfErrorSourseNew extends NewsStatus {
  final String error;
  StateOfErrorSourseNew(this.error);
}

class StateOfChangeAppTheme extends NewsStatus {}
