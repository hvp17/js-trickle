<?php

class Token
{

    public static function generate()
    {
        //base64_encode = we need it 'cause otherwise is gonna mess out our page our page will crash
        //openssl_random_pseudo_bytes = Generates a string of pseudo-random bytes, with the number of bytes determined by the length parameter.
        return $_SESSION['token'] = base64_encode(openssl_random_pseudo_bytes(32));
    }

    //check the token that has been set in the session.
    public static function check($token)
    {

        if (isset($_SESSION['token']) && $token === $_SESSION['token']) {
            unset($_SESSION['token']);
            return true;
        }
        return false;
    }
}
