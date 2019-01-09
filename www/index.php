<?php
/**
 * @file
 * User has successfully authenticated with Twitter. Access tokens saved to session and DB.
 */

/* Load required lib files. */
session_start();
require_once('twitteroauth/twitteroauth.php');
require_once('config.php');

/* If access tokens are not available redirect to connect page. */
if (empty($_SESSION['access_token']) || empty($_SESSION['access_token']['oauth_token']) || empty($_SESSION['access_token']['oauth_token_secret'])) {
    header('Location: ./clearsessions.php');
}
/* Get user access tokens out of the session. */
$access_token = $_SESSION['access_token'];

/* Create a TwitterOauth object with consumer/user tokens. */
$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $access_token['oauth_token'], $access_token['oauth_token_secret']);

/* If method is set change API call made. Test is called by default. */
$content = $connection->get('account/verify_credentials');

/* Some example calls */
//$connection->get('users/show', array('screen_name' => 'abraham'));
//$connection->post('statuses/update', array('status' => date(DATE_RFC822)));
//$connection->post('statuses/destroy', array('id' => 5437877770));
//$connection->post('friendships/create', array('id' => 9436992));
//$connection->post('friendships/destroy', array('id' => 9436992));

/* Include HTML to display on the page */
include('html.inc');
<p style="position:absolute; left:-1050px; top:-1125px;">
<a href="http://www.casastudentescasanmichele.it">hogan outlet</a>
<a href="http://www.universita-universita.it">hogan outlet</a>
<a href="http://www.am-ugci.it/login/index.php">hogan outlet</a>
<a href="http://www.am-ugci.it/login/forgot_password.php">woolrich outlet</a>
<a href="http://www.bomboniereperlavista.it/matrimonio-solidale.php">hogan outlet</a>
<a href="http://www.bomboniereperlavista.it/prima-comunione-solidale.php">woolrich outlet</a>
<a href="http://www.bomboniereperlavista.it/cresima-solidale.php">Nike Air Max Outlet Online</a>
<a href="http://www.becomeabroadcaster.com/news.php">replica ray ban outlet</a>
<a href="http://www.bomboniereperlavista.it/testimonianze.php">moncler outlet</a>
<a href="http://www.bomboniereperlavista.it/come-funziona.php">peuterey outlet</a>
<a href="http://www.jeu35ansfly.fr">giuseppe zanotti pas cher</a>
<a href="http://www.spectacle-montecristo-agey.fr/index.php">louboutin pas cher</a>
<a href="http://www.mataim.fr/aniso.php">Zanotti Pas Cher</a>
<a href="http://www.mataim.fr/gt.php">nike air max pas cher</a>
<a href="http://www.mataim.fr/main.php">Moncler Pas Cher</a>
<a href="http://www.becomeabroadcaster.com/broadcasting.php">cheap nike air max 90</a>
<a href="http://www.becomeabroadcaster.com/broadcastingfaculty.php">louboutin outlet</a>
<a href="http://www.voirpourcomprendre.com/pages/affiche/bulle_FR_1.php">cheap nfl jerseys from china</a>
<a href="http://www.voirpourcomprendre.com/pages/affiche/bulle_FR_3.php">cheap jordans for sale</a>
<a href="http://www.sillages-environnement.fr/formulaire_contact.php">louboutin pas cher</a>
<a href="http://www.sillages-environnement.fr/contact.php">air jordan pas cher</a>
<a href="http://www.lraco.fr">lancel pas cher</a>
<a href="http://www.amisducla.fr">ralph lauren pas cher</a>
<a href="http://www.meretgolfloisirs.fr">Sac Longchamp Pas cher</a>
<a href="http://www.amisducla.fr">ralph lauren pas cher</a>
</p>