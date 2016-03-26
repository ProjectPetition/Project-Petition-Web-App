package epetitions

class Petition {
  String title
  String body
  String url
  Integer created
  Integer deadline

  static mapping = {
    table 'petitions'
    version false
  }
  
  static hasMany = [signatureCounts: SignatureCount]
}
