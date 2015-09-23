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
                  <li class="active"><a href="/">Home</a></li>
                  <li><a href="/about">About</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading"><img src="static/images/start.png"></h1>

            <form action="/rentals" method="GET" class="form-style-5" role"form">
              <div class="col-xs-6">
                <label for="city">City</label>
                <select id="city" name="city">
                    <option value="Eugene">Eugene</option>
                    <option value="Springfield">Springfield</option>
                    <option value="Veneta">Veneta</option>
                    <option value="Creswell">Creswell</option>
                    <option value="CottageGrove">Cottage Grove</option>
                 </select>
              </div>
              <div class="col-xs-6">
                    <label for="zip">Zip Code</label>
                    <input type="number" name="zip" size="5">
              </div>
              <div class="col-xs-6">
                    <label>Price</label>
                    <input type="number" name="min-cost" placeholder="Min">
                    <input type="number" name="max-cost" placeholder="Max">
              </div>
              <div class="col-xs-6">
                    <label>Square Footage</label>
                    <input type="number" name="min-size" placeholder="Min">
                    <input type="number" name="max-size" placeholder="Max">
              </div>
              <div class="col-xs-6">
                    <label for="bed">Beds</label>
                    <select id="bed" name="bed">
                        <option value="0">0 +</option>
                        <option value="1">1 +</option>
                        <option value="2">2 +</option>
                        <option value="3">3 +</option>
                        <option value="4">4 +</option>
                        <option value="5">5 +</option>
                        <option value="6">6 +</option>
                    </select>
              </div>
              <div class="col-xs-6">
                    <label for="bath">Baths:</label>
                    <select id="bath" name="bath">
                        <option value="0">0 +</option>
                        <option value="1">1 +</option>
                        <option value="2">2 +</option>
                        <option value="3">3 +</option>
                        <option value="4">4 +</option>
                        <option value="5">5 +</option>
                        <option value="6">6 +</option>
                    </select>
              </div>
              <div class="col-xs-6">
                    <label>Available By:</label>
                    <input type="date" name="available" placeholder="mm/dd/yyyy">
              </div>
              <div class="col-xs-6">
                    <label>Lease Type:</label>
                    <select name="lease">
                        <option value="ANY">Any Lease Length</option>
                        <option value="1">Month-to-Month</option>
                        <option value="6">6 Month or Less</option>
                        <option value="12">12 Month or Less</option>
                    </select>
              </div>
              <div class="col-xs-12">
                    <label>Type:</label>
                    <input type="checkbox" name="studio" value="Studio" checked="True">Studio
                    <input type="checkbox" name="house" value="House" checked="True">House
                    <input type="checkbox" name="apartment" value="Apartment" checked="True">Apartment
                    <input type="checkbox" name="condo" value="Condo" checked="True">Condo
              </div>
              <div class="col-xs-12">
                    <label>Pets:</label>
                    <input type="checkbox" name="cats" value="1">Cats Ok
                    <input type="checkbox" name="dogs" value="1">Dogs Ok
              </div>
              <div class="col-xs-12">
                <button class="btn btn-lg btn-default" action="submit" type="submit">Find It</button>
              </div>
            </form>
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
