class ApplicationBootstrap
{
	def init = 
	{ 
		servletContext ->
		new User(email:"klim@albany.edu", password:"abcd1234").save()
	}
	def destroy = 
	{
		
	}
}