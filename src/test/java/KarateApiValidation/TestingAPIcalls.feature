
Feature: Verifying the creation on Auth code using Post method

  Scenario: creation on Auth code

    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { username: 'admin' , password:	'password123' }
    When method post
    Then status 200

  Scenario: get booking ID's
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method get
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse

  Scenario: get booking ID's filtering by name firstname=sally&lastname=brown
    * def query = { firstname: 'sally', lastname: 'brown'}
    Given url 'https://restful-booker.herokuapp.com/booking'
    And params query
    When method get
    Then status 200
    * print response

  Scenario: get booking ID's filtering by checkin=2014-03-13&checkout=2014-05-21
    * def query = { checkin: '2014-03-13', checkout: '2014-05-21'}
    Given url 'https://restful-booker.herokuapp.com/booking'
    And params query
    When method get
    Then status 200
    * print response

#  "firstname" : "James",
#  "lastname" : "Brown",
#  "totalprice" : 111,
#  "depositpaid" : true,
#  "bookingdates" : {
#  "checkin" : "2018-01-01",
#  "checkout" : "2019-01-01"
#  },
#  "additionalneeds" : "Breakfast"

  Scenario: Updating the booking using Put method
    * def id =
    """
    {
      "depositpaid": "false"
    }

    """
    Given url '//restful-booker.herokuapp.com/booking/:id'
    And request { firstname: 'Jim', lastname: 'Brown', totalprice: '111', depositpaid:'true', checkin:'2018-01-01', checkout:'2019-01-01', additionalneeds:'Breakfast'}
    And header Authorization = 'YWRtaW46cGFzc3dvcmQxMjM='
    When method put
    Then status 200
    * print response

