package epetitions

class MainController
{

	def index() {
                // trying to get the trending petitions:
		List sigCounts = SignatureCount.findAllByForecastAndDateGreaterThan(false, new Date() - 2).sort{-it.count}
		if (sigCounts.collect{it.count}.max() < 10) {
		  // We The People is incredibly unreliable and may be missing most or all of the signatures from yesterday
		  sigCounts = SignatureCount.findAllByForecastAndDateGreaterThan(false, new Date() - 3).sort{-it.count}
		}
		List p = sigCounts.collect{it.petition}


		//List p2 = Petition.getAll()
		[p:p]
	}

	def forecast(int id) {
	  // providing information for the forecast graphs
	  List counts = Petition.get(id).signatureCounts.sort{it.date}
	  List c2 = counts.collect{[value:it.cumulative, date:it.date.format("yyyy-MM-dd"), l:it.lowerBound, u:it.upperBound]}
	  for (c in c2) {
	    if (c["l"] == null) { c["l"] = c.value }
	    if (c["u"] == null) { c["u"] = c.value }
	  }
	  render(contentType: "text/json") {
	    c2
	  }
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
