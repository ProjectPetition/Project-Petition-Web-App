package epetitions

class MainController
{

	def index() {
		render (view: 'index.gsp')
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
