class UserController
{
	def login = 
	{

	}
	def doLogin = 
	{
		def user = User.findWhere(email:params['email'], password:params['password'])
		session.user = user
		if(user)
		redirect(controller:'signup', action:'list')
		else
		redirect(controller:'user', action:'login')
	}
}