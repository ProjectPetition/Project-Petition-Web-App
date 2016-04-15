class signup
{
	Long id
	Long version
	 String firstName
	 String lastName
	 String email

	 String toString () = 
	 {
	 	"${this.class.name} : $id"
	 }
	 boolean equals(other)
	 {
	 	if(other?.is(this)) return true
	 	if(!(other instanceof signup)) return false
	 	if(!id || !other?.id || id!=other?.id) return false
	 	return true
	 }
	 int hashCode()
	 {
	 	int hashCode = 0
	 	hashCode = 29 * (hashCode + (!id ? 0 : id ^ (id >>> 32)))
	 }
}