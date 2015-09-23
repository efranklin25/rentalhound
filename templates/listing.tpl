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

    <title>{{listing['title']}}</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/cover.css" rel="stylesheet">
    <link href="/static/css/forms.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/static/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner-solo">

        <div class="cover-container">

          <div class="masthead-solo clearfix rentalhound">
            <div class="inner">
              <h3 class="masthead-brand"><img src="/static/images/rental.png"><img src="/static/images/hound.png"></h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="/">Home</a></li>
                  <li><a href="/about">About</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="listing-container">
             <div class="row"> 
              <!-- First Row -->
              <div class="col-sm-8 col-left">
                %from tools import carousel_images
                <div id="listing-carousel" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                  {{!carousel_images(listing["images"])['indicators']}}
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    {{!carousel_images(listing["images"])['images']}}
                  </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#listing-carousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#listing-carousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
              <div class="col-sm-4 col-right">
                  <div class="row">
                  <h2>${{listing['cost']}} / Month</h2>
                  </div>
                  <div class="row">
                  %import tools
                  {{listing["bedrooms"]}} Beds &middot; {{listing["bathrooms"]}} Bath &middot; {{tools.if_unspecified(listing["sizeSQF"])}} Square Feet<br>
                  Available: {{listing["available"]}}<br>
                  {{!tools.print_pet(listing["pets"])}}<br>
                  Lease Type: {{tools.print_lease(listing["lease"])}}<br>
                  Security Deposit: {{tools.print_secDeposit(listing["secDeposit"])}}
                  </div>
                  <div class="row">
                    <img class="img-map" src="http://maps.googleapis.com/maps/api/staticmap?center=410%20A%20E.%2016th%20Avenue,+Eugene,+OR&zoom=12&size=205x205&maptype=roadmap&markers=color:blue|410%20A%20E.%2016th%20Avenue,+Eugene,+OR&sensor=false&key=AIzaSyAF2mqnWuR-TlvPi-sRDf46tqLam_T9y4Y">
                  </div>
                </div>
              </div>

              <div class="row">
                <!-- Second Row --> 
                <div class="col-sm-12">
                  <h3>{{listing["location"]["address"]}}, {{listing["location"]["city"]}}, {{listing["location"]["state"]}} {{listing["location"]["zip_code"]}}</h3>
                  <h5>{{listing["contact"]["name"]}} &middot; {{listing["contact"]["phone"]}}</h5>
                  <div class="well">
                  <p>{{listing["description"]}}</p>
                  </div>
                </div>
              </div>
          </div>

          <div class="mastfoot col-sm-12">
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
    <script src="/static/js/bootstrap.js"></script>
    <script src="/static/js/carousel.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/static/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
