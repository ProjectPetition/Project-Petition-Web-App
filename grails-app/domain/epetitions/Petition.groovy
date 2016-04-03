package epetitions

class Petition {
  String title
  String body
  String url
  Integer signatureCount
  Integer created
  Integer deadline

  static mapping = {
    table 'petitions'
    version false
    signatureCount column: "signatureCount"
  }
  
  static hasMany = [signatureCounts: SignatureCount]
}
