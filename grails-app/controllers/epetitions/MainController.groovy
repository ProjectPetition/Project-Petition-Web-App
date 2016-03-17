package epetitions
import groovy.sql.Sql

class MainController
{
	// doesn't work, some issue with the database metadata?
	//def dataSource

	def index() {
		Petition p = Petition.read(1982541)

		//def sql = new Sql(dataSource)
		//def db = [url:'jdbc:mysql://127.0.0.1:3306/website', user:'root', password:'root', driver:'org.h2.Driver']
		//def sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
		//def temp = sql.rows("select * from petitions limit 10")
		//[temp: temp, sql:sql]
		[ p:p ]
	}

	def responses() {
		render (view: 'responses.gsp')
	}

	def publications() {
		render (view: 'publications.gsp')
	}

	def about() {
		render (view: 'about.gsp')
	}

	def login() {
		render (view: 'login.gsp')
	}

	def signup() {
		render (view: 'signup.gsp')
	}

	def download() {

		//def file = new File("/assets/documents")

		//if (file.exists()) {
		//	response.setContentType("application/octet-stream")
		//	response.setHeader("Content-disposition", "filename=${file.name}")
		//	response.outputStream << file.bytes
		//	return
		//}
		//render(file: new File(absolutePath), fileName: "book.pdf")
	}



}
