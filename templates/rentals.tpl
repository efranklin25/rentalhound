<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/static/images/favicon.ico">

    <title>Rental Hound</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="static/css/cover.css" rel="stylesheet">
    <link href="static/css/forms.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="static/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix rentalhound">
            <div class="inner">
              <h3 class="masthead-brand"><img src="static/images/rental.png"><img src="static/images/hound.png"></h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="/">Home</a></li>
                  <li class="active"><a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Toggle Filters</a></li>
                  <li><a href="/about">About</a></li>
                </ul>
              </nav>

              <div class="collapse" id="collapseExample">
                <div class="">
                  {{!new_form}}
                </div>
              </div>
            </div>
          </div>

          <div class="result-container">

          %from tools import if_unspecified
          %for listing in returned_listings:
            <div class="row result_row">
              <div class="col-xs-3 left">
                <img class="img-responsive result_img" src="{{listing['images'][0]}}">
              </div>
              <div class="col-xs-6">
                <h3 class="listing-title"><a target="_blank" href="/rentals/{{listing["_id"]}}">{{listing["title"]}}</a></h3>
                <h3>${{listing["cost"]}}/month</h3>
                <h4>{{listing["location"]["address"]}}, {{listing["location"]["city"]}}, {{listing["location"]["state"]}} {{listing["location"]["zip_code"]}}</h4>
                <h4>{{listing["bedrooms"]}} Beds &middot; {{listing["bathrooms"]}} Bath &middot; {{if_unspecified(listing["sizeSQF"])}} Square Feet</h4>
              </div>
              <div class="col-xs-3 right">
                <img class="img-responsive result_img" src="http://maps.googleapis.com/maps/api/staticmap?center={{listing["location"]["address"]}},+{{listing["location"]["city"]}},+{{listing["location"]["state"]}}&amp;zoom=11&amp;size=225x225&amp;maptype=roadmap&amp;markers=color:blue|{{listing["location"]["address"]}},+{{listing["location"]["city"]}},+{{listing["location"]["state"]}}&amp;sensor=false&amp;key=AIzaSyAF2mqnWuR-TlvPi-sRDf46tqLam_T9y4Y" alt="Map">
              </div>
            </div> 
          %end     
          </div>

          <div class="mastfoot col-xs-12">
            <div class="inner">
              <p>&copy; 2015 Rental Hound &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </div>
          </div>

        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="static/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
