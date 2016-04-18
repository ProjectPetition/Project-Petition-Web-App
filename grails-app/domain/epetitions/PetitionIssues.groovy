package epetitions

class PetitionIssue {
  Petition petition
  String issue
  Date date

  static mapping = {
    table 'petitionIssues'
    version false
  }
}
