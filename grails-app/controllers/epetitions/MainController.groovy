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

		// get issue counts
		def issueCounts = PetitionIssue.findAllByDateGreaterThan(new Date() - 14).collect{it.issue}.countBy{it}
		// List issueList = issues.collect{it.issue}
		// Set uniqueIssues = issueList.toSet()
		// def issueCounts = issueList.countBy { it }

		// Integer x = 0
		// for (item in uniqueIssues) {
		//   issueCounts[x] = new Array()
		//   issueCounts[x][1] = 
		//   i
		// }

		//List p2 = Petition.getAll()
		[p:p, issueCounts:issueCounts]
	}

	def forecast(int id) {
	  // providing information for the forecast graphs
	  Petition p = Petition.get(id)
	  List counts = p.signatureCounts.sort{it.date}
	  List c2 = counts.collect{[value:it.cumulative, date:(it.date + 1).format("yyyy-MM-dd"), l:it.lowerBound, u:it.upperBound]}
	  c2.add(0, [value:0, date:counts[0].date.format("yyyy-MM-dd"), l:0, u:0])
	  for (c in c2) {
	    if (c["l"] == null) { c["l"] = c.value }
	    if (c["u"] == null) { c["u"] = c.value }
	  }
	  render(contentType: "text/json") {
	    c2
	    //counts
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
