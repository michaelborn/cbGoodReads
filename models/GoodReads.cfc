/**
* I use Hyper to build HTTP requests to hit the GoodReads API.
*/
component accessors="true"{
	
	// Properties
	property name="hyper" inject="HyperBuilder@Hyper";

	property name="baseURI" inject="coldbox:setting:baseURI@cbGoodReads";
	property name="APIKey" inject="coldbox:setting:APIKey@cbGoodReads";
	

	/**
	 * Constructor
	 */
	GoodReads function init(){
		return this;
	}

	/**
	 * Get book reviews by GoodReads book ID.
	 * 
	 * @cite https://www.goodreads.com/api/index#book.show
	 * @id {String} book id to filter book reviews
	 * @returns a HyperResponse object. See https://forgebox.io/view/hyper.
	 */
	HyperResponse function getReviewsByBookId( required string id ){
		return hyper.new().get(
			url = getBaseURI() & "/book/show",
			queryParams = {
				"format" : "json",
				"key" : getAPIKey(),
				"id" : arguments.id
			}
		);
	}

	/**
	 * Get book reviews by book ISBN
	 * 
	 * @cite https://www.goodreads.com/api/index#book.show_by_isbn
	 * @ISBN {String} ISBN to filter book reviews
	 * @returns a HyperResponse object. See https://forgebox.io/view/hyper.
	 */
	HyperResponse function getReviewsByISBN( required string ISBN ){
		return hyper.new().get(
			url = getBaseURI() & "/book/isbn/" & arguments.ISBN,
			queryParams = {
				"format" : "json",
				"key" : getApiKey()
			}
		);
	}
	

}