package epetitions

class SignatureCount {
  Petition petition
  Date date
  Integer count
  Integer cumulative
  Integer upperBound
  Integer lowerBound
  Boolean forecast

  static mapping = {
    table 'signatureCounts'
    version false
    upperBound column: "upperBound"
    lowerBound column: "lowerBound"
  }
}
