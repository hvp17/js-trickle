<!DOCTYPE html>
<html lang="en">

<head>
  <title>Js Trickle &mdash; Colorlib Website Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="css/animate.css">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">



  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <!--   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
 -->
  <!-- PROFILE ---------->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab:300">
  <!--   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 -->
  <!------ end PROFILE ---------->






  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/style.css">

  <script src="https://www.google.com/recaptcha/api.js" async defer></script>

</head>

<body>
  <?php
  session_start();
  if ($_SESSION['jUser']) {
    //AUTOMATIC LOGOUT AFTER 1 HOUR
    if ((time() - $_SESSION['last_login_timestamp']) > 3600) //900 = 15*60
    {
      header('Location: logout.php');
      exit;
    } else {
      //AUTOMATIC UPDATE TIME IF INTERACTING WITH WEBSITE
      $_SESSION['last_login_timestamp'] = time();
    }

    ?>

    <div class="site-wrap">

      <div class="site-mobile-menu">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div> <!-- .site-mobile-menu -->


      <div class="site-navbar-wrap js-site-navbar bg-white">

        <div class="container-menu">
          <div class="site-navbar bg-light">
            <div class="py-1">
              <div class="row align-items-center">
                <div class="col-2">
                  <h2 class="mb-0 site-logo"><a href="index.php">Js<strong class="font-weight-bold">Trickle</strong> </a></h2>
                </div>
                <div class="col-10">
                  <nav class="site-navigation text-right" role="navigation">
                    <div class="container-menu">
                      <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

                      <ul class="site-menu js-clone-nav d-none d-lg-block">
                        <li><a href="tags.php">Tags</a></li>
                        <li><a href="wc.php">Weekly Challenges</a></li>
                        <!--li><a href="contact.php">Profile</a></li-->


                        <!--                         <li><a href="new-post.php"><span class="bg-primary text-white py-3 px-4 rounded"><span class="icon-plus mr-3"></span>Ask Question</span></a></li>
                                                             -->
                        <li><a href="new-post.php"><button class="btn btn-primary text-white">
                              <span class="icon-plus mr-3"></span>Ask Question
                            </button></a></li>


                        <li>
                          <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                              <!--span class="bg-primary text-white py-3 px-4 rounded"-->
                              <i class="fas fa-user"></i>
                              <!--/span-->
                            </button>
                            <ul class="dropdown-menu">
                              <li><a href="profile.php">Profile</a></li>
                              <li><a href="logout.php">Logout</a></li>

                            </ul>
                          </div>
                          <!--a href="logout.php">
                                                                                      <span class="bg-primary text-white py-3 px-4 rounded">
                                                                                        <i class="fas fa-user"></i>Logout
                                                                                      </span>
                                                                                    </a-->
                        </li>
                      </ul>
                    </div>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div style="height: 113px;"></div>

    <?php
  } else {
    ?>

      <div class="site-wrap">

        <div class="site-mobile-menu">
          <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
              <span class="icon-close2 js-menu-toggle"></span>
            </div>
          </div>
          <div class="site-mobile-menu-body"></div>
        </div> <!-- .site-mobile-menu -->


        <div class="site-navbar-wrap js-site-navbar bg-white">

          <div class="container-menu">
            <div class="site-navbar bg-light">
              <div class="py-1">
                <div class="row align-items-center">
                  <div class="col-2">
                    <h2 class="mb-0 site-logo"><a href="index.php">Js<strong class="font-weight-bold">Trickle</strong> </a></h2>
                  </div>
                  <div class="col-10">
                    <nav class="site-navigation text-right" role="navigation">
                      <div class="container-menu">
                        <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

                        <ul class="site-menu js-clone-nav d-none d-lg-block">
                          <li><a href="tags.php">Tags</a></li>
                          <li><a href="wc.php">Weekly Challenges</a></li>
                          <!--li><a href="contact.php">Profile</a></li-->
                          <li>

                            <div class="dropdown">
                              <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                                <!--span class="bg-primary text-white py-3 px-4 rounded"-->
                                <i class="fas fa-user"></i>
                                <!--/span-->
                              </button>
                              <ul class="dropdown-menu">
                                <li><a href="login.php">Login</a></li>
                                <li><a href="register.php">Register</a></li>
                              </ul>
                            </div>





                          </li>
                        </ul>
                      </div>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div style="height: 113px;"></div>



      <?php
    }
    ?>