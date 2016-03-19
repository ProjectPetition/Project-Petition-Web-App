package epetitions

class Petition {
  String title
  String body
  String url
  Integer created

  static mapping = {
    table 'petitions'
    version false
  }
  
  static hasMany = [signatureCounts: SignatureCount]
}
